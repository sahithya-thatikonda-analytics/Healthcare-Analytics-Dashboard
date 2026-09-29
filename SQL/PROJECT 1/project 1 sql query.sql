WITH monthly_encounters AS (

    SELECT

        DATE_TRUNC('month', start)::date
        AS encounter_month,

        COUNT(id)
        AS total_encounters,

        COUNT(DISTINCT patient)
        AS active_patients

    FROM encounters

    WHERE start >= '2015-01-01'

    GROUP BY encounter_month
),

readmission_analysis AS (

    SELECT

        patient,

        start::date
        AS encounter_date,

        LEAD(start::date) OVER(
            PARTITION BY patient
            ORDER BY start
        ) AS next_encounter_date

    FROM encounters

    WHERE start >= '2015-01-01'
),

readmission_kpi AS (

    SELECT

        COUNT(*) AS total_encounters,

        SUM(

            CASE

                WHEN next_encounter_date IS NOT NULL

                AND next_encounter_date <=
                    encounter_date + INTERVAL '30 days'

                THEN 1

                ELSE 0

            END

        ) AS readmission_encounters,

        ROUND(

            SUM(

                CASE

                    WHEN next_encounter_date IS NOT NULL

                    AND next_encounter_date <=
                        encounter_date + INTERVAL '30 days'

                    THEN 1

                    ELSE 0

                END

            ) * 100.0 / COUNT(*),

            2

        ) AS readmission_rate

    FROM readmission_analysis
),

length_of_stay_kpi AS (

    SELECT

        ROUND(
            AVG(stop::date - start::date),
            2
        ) AS average_length_of_stay_days,

        MAX(stop::date - start::date)
        AS max_length_of_stay_days

    FROM encounters

    WHERE encounterclass = 'inpatient'

    AND stop IS NOT NULL

    AND stop > start
),

ed_utilization_kpi AS (

    SELECT

        COUNT(*) AS total_ed_visits,

        COUNT(DISTINCT patient)
        AS unique_ed_patients

    FROM encounters

    WHERE encounterclass = 'emergency'
),

high_utilizer_patients AS (

    SELECT

        patient,

        COUNT(id)
        AS total_encounters

    FROM encounters

    GROUP BY patient

    HAVING COUNT(id) >= 15
),

high_utilizer_kpi AS (

    SELECT

        COUNT(*)
        AS high_utilizer_patients

    FROM high_utilizer_patients
),

care_gap_analysis AS (

    SELECT

        patient,

        MAX(start::date)
        AS last_encounter_date,

        CURRENT_DATE - MAX(start::date)
        AS days_since_last_encounter

    FROM encounters

    GROUP BY patient
),

care_gap_kpi AS (

    SELECT

        COUNT(*) FILTER(
            WHERE days_since_last_encounter > 365
        ) AS severe_care_gap_patients,

        COUNT(*) FILTER(
            WHERE days_since_last_encounter
            BETWEEN 181 AND 365
        ) AS moderate_care_gap_patients

    FROM care_gap_analysis
),

organization_workload AS (

    SELECT

        organization,

        COUNT(id)
        AS total_encounters,

        COUNT(DISTINCT patient)
        AS unique_patients

    FROM encounters

    GROUP BY organization
),

top_organization AS (

    SELECT

        organization,

        total_encounters,

        unique_patients

    FROM organization_workload

    ORDER BY total_encounters DESC

    LIMIT 1
)

SELECT

    m.encounter_month,

    m.total_encounters,

    m.active_patients,

    r.readmission_rate,

    l.average_length_of_stay_days,

    e.total_ed_visits,

    h.high_utilizer_patients,

    c.severe_care_gap_patients,

    c.moderate_care_gap_patients,

    t.organization
    AS top_organization,

    t.total_encounters
    AS top_organization_encounters

FROM monthly_encounters m

CROSS JOIN readmission_kpi r

CROSS JOIN length_of_stay_kpi l

CROSS JOIN ed_utilization_kpi e

CROSS JOIN high_utilizer_kpi h

CROSS JOIN care_gap_kpi c

CROSS JOIN top_organization t

ORDER BY m.encounter_month;

