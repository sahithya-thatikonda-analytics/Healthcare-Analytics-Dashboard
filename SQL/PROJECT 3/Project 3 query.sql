with encounter_timeline_analysis as (
     select patient,id as encounter_id,encounterclass,start::date as encounter_date,
	        lag(start::date) over(
                            partition by patient
							order by start::date) as previous_encounter_date,
			lead(start::date) over (
                               partition by patient
							order by start::date) as next_encounter_date,
			start::date-lag(start::date) over(
                            partition by patient
							order by start) as days_since_previous_encounter,
			lead(start::date) over (
                               partition by patient
							order by start::date) - start::date as days_until_next_encounter
	from encounters
			),

rolling_180_days_kpi as (
      select e1.patient,e1.id as encounter_id,e1.start as encounter_date,
	         count(e2.id) as rolling_180_days_encounters
	from encounters e1
	join encounters e2
	on e1.patient=e2.patient
	  and e2.start between e1.start-interval '180 days' 
	       and e1.start
	group by e1.patient,e1.id,e1.start
),

rolling_360_days_kpi as (
      select e1.patient,e1.id as encounter_id,e1.start as encounter_date,
	         count(e2.id) as rolling_365_days_encounters
	from encounters e1
	join encounters e2
	on e1.patient=e2.patient
	  and e2.start between e1.start-interval '365 days' 
	       and e1.start
    group by e1.patient,e1.id,e1.start
),

inpatient_visit_kpi as (
     select patient ,id as encounter_id,count(*) as total_inpatient_encounters
	 from encounters
	 where encounterclass='inpatient'
	 group by patient,encounter_id
),

ed_visit_kpi as (
    select patient , id as encounter_id,count(*) as total_ed_encounters
	 from encounters
	 where encounterclass='emergency'
	 group by patient,encounter_id
),

readmission_kpi as (
     select patient,encounter_id,
	      case 
		      when days_until_next_encounter <=30
			  then 1
			  else 0
			  end as readmission_flag
	from encounter_timeline_analysis 

	
),

rapid_return_kpi as (
       select patient,encounter_id,
	        case 
		      when days_until_next_encounter <=7
			  then 1
			  else 0
			  end as rapid_return_flag
		from encounter_timeline_analysis 
	
)

select p.id as patient_id,p.first||' '||p.last as patient_name,ea.encounter_id,ea.encounter_date,
      ea.encounterclass, 
	  ea.previous_encounter_date,
	  ea.next_encounter_date,
	  coalesce(ea.days_since_previous_encounter,0) as days_since_previous_encounter,
	  coalesce(ea.days_until_next_encounter,0) as days_until_next_encounter,
	  coalesce(rl.rolling_180_days_encounters,0) as rolling_180_days_encounters,
	  coalesce(rd.rolling_365_days_encounters,0) as rolling_365_days_encounters,
	  coalesce(ip.total_inpatient_encounters,0) as total_inpatient_encounters,
	  coalesce(ed.total_ed_encounters,0) as total_ed_encounters,
	  coalesce(r.readmission_flag,0) as readmission_flag,
	  coalesce(rr.rapid_return_flag,0) as rapid_return_flag,
	  round((rl.rolling_180_days_encounters::numeric/180),2) as utilization_velocity,
	   case 
	      when rd.rolling_365_days_encounters >= 20
		  then 'extreme_utilizer'
		  when rd.rolling_365_days_encounters between 10 and 19
		  then 'high_utilizer'
		  when rd.rolling_365_days_encounters between 5 and 9
		  then 'moderate_utilizer'
		  else 'low_utilizer'
		  end as utilization_risk_category
	from encounter_timeline_analysis ea
	left join patients p
	on ea.patient=p.id
	left join rolling_180_days_kpi rl
	on ea.encounter_id=rl.encounter_id
	left join rolling_360_days_kpi rd
	on ea.encounter_id= rd.encounter_id
	left join inpatient_visit_kpi ip
	on ea.encounter_id= ip.encounter_id
	left join ed_visit_kpi ed
	on ea.encounter_id=ed.encounter_id
	left join readmission_kpi r
	on ea.encounter_id=r.encounter_id
	left join rapid_return_kpi rr
	on ea.encounter_id=rr.encounter_id
order by utilization_risk_category ;
	