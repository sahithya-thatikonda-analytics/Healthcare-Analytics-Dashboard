WITH encounter_kpi as(
   select patient,count(id) as total_encounters,
   case
      when count(id) >= 15
	  then 'high_utilizer'
	  when count(id) between 5 and 14
	  then 'moderate_utilizer'
	  when count(id) <=5
	  then 'low_utilizer'
	  end as utilization_category
	 from encounters
	 WHERE start >= '2015-01-01'
	 group by patient
	 
),

conditions_kpi as (
   select patient, count(distinct description) as total_conditions
   from conditions
   group by patient
   
),

medications_kpi as (
   select patient,count(distinct description) as total_medications,
   case
      when count(distinct description) >=10
	  then 'high_polypharmacy'
	  when count(distinct description) between 5 and 9
	  then 'moderate_polypharmacy'
	  when count(distinct description)<=5
	  then 'low_polypharmacy'
	  end as medication_burden_category
	from medications
	group by patient
   
),

ed_kpi as (
    select patient, count(*) as total_ed_encounters,
	count(distinct patient ) as unique_ed_patients
	from encounters
	where encounterclass='emergency'
	 and start >= '2015-01-01'
	group by patient
),

inpatients_visits_kpi as  (
    select patient,count(*) as total_inpatient_visits
	from encounters
	where encounterclass = 'inpatient'
	and  start >= '2015-01-01'
	group by patient
	
),

readmission_analysis as (
   select patient,start::date as encounter_date,
    lead(start::date) over (  partition by patient
	                           order by start ) as next_encounter_date
	from encounters
	where start > '2015-01-01'
),

readmission_kpi as (
    select patient,
	       count(*) as total_readmission_encounters
	from readmission_analysis
	where next_encounter_date<= encounter_date+interval '30 days'
	group by patient
),

care_gap_analysis as(
   select patient,max(start::date) as last_encounter_date,
      current_date - max(start::date) as days_since_last_encounter
	from encounters
	WHERE start >= '2015-01-01'
	group by patient
),

care_gap_kpi as (
    select patient,last_encounter_date,days_since_last_encounter,
	       case
		       when days_since_last_encounter > 365
			   then 'severe_care_gap_patient'
			   when days_since_last_encounter between 181 and 365
			   then 'moderate_care_gap_patient'
			   when days_since_last_encounter <= 180
			   then 'active_patient'
			   end as care_gap_category
	from care_gap_analysis
)

select p.id as patient_id, p.first||' '||p.last as patient_name,
extract(year from age(current_date,birthdate)) as age, coalesce(e.total_encounters,0) as total_encounters ,
       coalesce(c.total_conditions,0) as total_conditions,
       coalesce(m.total_medications,0) as total_medications,
	   coalesce(ek.total_ed_encounters,0) as total_ed_encounters,
	   coalesce(r.total_readmission_encounters,0) as total_readmission_encounters,
	   coalesce(ip.total_inpatient_visits,0) as total_inpatient_visits,
	   coalesce(ck.days_since_last_encounter,0) as days_since_last_encounter,  
	   e.utilization_category ,
	   m.medication_burden_category,
	   ck.care_gap_category,
	   case
	      when coalesce(e.total_encounters,0) >= 15 
		      and coalesce(c.total_conditions,0) >=5 
			  and coalesce(m.total_medications,0) >=10
			  then 'high_risk'
		when coalesce(e.total_encounters,0) between 5 and 14 
		     or coalesce(m.total_medications,0) between 5 and 9
			 then 'moderate_risk'
		else 'low_risk'
		end as overall_risk_category
from patients  p
left join encounter_kpi  e
on p.id=e.patient 
left join conditions_kpi  c
on p.id=c.patient
left join medications_kpi  m
on p.id=m.patient
left join ed_kpi  ek
on p.id = ek.patient
left join inpatients_visits_kpi  ip
on p.id = ip.patient
left join readmission_kpi  r
on p.id = r.patient
left join care_gap_kpi  ck 
on p.id=ck.patient
where extract(year from age(current_date,birthdate)) <= 100
order by overall_risk_category ,
         total_encounters desc;