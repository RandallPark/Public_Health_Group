/* --------------------------------------------------------------------------------

Project:        USC Substance Abuse, Project 2
Date Created:   5/18/2019
Github:         https://github.com/RandallPark/Public_Health_Group
Summary:        Potential queries to be used for plotting.  Will hit against 3 main tables:
                    1.  adm_lookups
                    2.  disch_lookups
                    3.  drug_deaths


--------------------------------------------------------------------------------  */


--note: many queries returning multiple rows, consider using LIMIT
--to reduce the amount of rows returned (maybe top 10, top 5)


-----------------------------------------------
--fix error code 1206
-----------------------------------------------

-- Error encountered: Error Code: 1206. The total number of locks exceeds the lock table size

--Reason:  the buffer pool size is set small, approx 8 MB.  

--Fix:  Once logged in to MySQL, run this command to increase the innodb_buffer_pool_size:

-- mysql> SET GLOBAL innodb_buffer_pool_size=64388608;

--Notes:  When you log out or shutdown server, and then restart, the buffer pool size may shrink back to original size.
--Run the command to increase once again if you encounter error code 1206.




--######################################################################
--   __      ___                 _ _          _   _                 
--    \ \    / (_)               | (_)        | | (_)                
--     \ \  / / _ ___ _   _  __ _| |_ ______ _| |_ _  ___  _ __  ___ 
--      \ \/ / | / __| | | |/ _` | | |_  / _` | __| |/ _ \| '_ \/ __|
--       \  /  | \__ \ |_| | (_| | | |/ / (_| | |_| | (_) | | | \__ \
--        \/   |_|___/\__,_|\__,_|_|_/___\__,_|\__|_|\___/|_| |_|___/
--                                                                   
--                                                                   
--######################################################################



--------------------------------------------------
--treatment complete/incomplete by primary drug
--------------------------------------------------

select
  a.primary_drug,
  sum(a.treatment_completed) treatment_completed,
  sum(b.treatment_incomplete) treatment_incomplete
from
  (  
    select
     sub1_de 'primary_drug',
     count(reason_de) 'treatment_completed'
    from
      disch_lookup_final
    where
      reason_de = 'Complete'
    group by
      sub1_de
   ) a,
    (select
      sub1_de 'primary_drug',
      count(reason_de) 'treatment_incomplete'
     from
       disch_lookup_final
     where
       reason_de != 'Complete'
     group by
       sub1_de
     ) b
where
  a.primary_drug = b.primary_drug
group by
  a.primary_drug;   


--------------------------------------------------
--treatment complete/incomplete by secondary drug
--------------------------------------------------

select
  a.secondary_drug,
  sum(a.treatment_completed) treatment_completed,
  sum(b.treatment_incomplete) treatment_incomplete
from
  (  
    select
     sub2_d_de 'secondary_drug',
     count(reason_de) 'treatment_completed'
    from
      disch_lookup_final
    where
      reason_de = 'Complete'
    group by
      sub2_d_de
   ) a,
    (select
      sub2_d_de 'secondary_drug',
      count(reason_de) 'treatment_incomplete'
     from
       disch_lookup_final
     where
       reason_de != 'Complete'
     group by
       sub2_d_de
     ) b
where
  a.secondary_drug = b.secondary_drug
group by
  a.secondary_drug;   


--------------------------------------------------
--primary pay method for treatment
--------------------------------------------------

select
  a.payment_method,
  sum(a.treatment_completed) treatment_completed,
  sum(b.treatment_incomplete) treatment_incomplete
from
  (  
    select
     primpay_de 'payment_method',
     count(reason_de) 'treatment_completed'
    from
      disch_lookup_final
    where
      reason_de = 'Complete'
    group by
      primpay_de
   ) a,
    (select
      primpay_de 'payment_method',
      count(reason_de) 'treatment_incomplete'
     from
       disch_lookup_final
     where
       reason_de != 'Complete'
     group by
       primpay_de
     ) b
where
  a.payment_method = b.payment_method
group by
  a.payment_method; 


--------------------------------------------------
--days wait for treatment
--------------------------------------------------


select
  a.days_wait,
  sum(a.treatment_completed) treatment_completed,
  sum(b.treatment_incomplete) treatment_incomplete
from
  (  
    select
     daywait_de 'days_wait',
     count(reason_de) 'treatment_completed'
    from
      disch_lookup_final
    where
      reason_de = 'Complete'
    group by
      daywait_de
   ) a,
    (select
      daywait_de 'days_wait',
      count(reason_de) 'treatment_incomplete'
     from
       disch_lookup_final
     where
       reason_de != 'Complete'
     group by
       daywait_de
     ) b
where
  a.days_wait = b.days_wait
group by
  a.days_wait; 



-----------------------------------------------
--drug deaths by state 
-----------------------------------------------

--original
select
  state_de,
  deaths
from
  drug_deaths;
  
--new viz
/* deaths,
count of male, female, tx_complete, tx_incomplete, 
*/ 


--TABLE MODIFICATIONS TO PERFORM THIS JOIN
alter table drug_deaths add column state_full_name_de varchar(25) fourth;

update drug_deaths
set state_full_name_de = case when state_de = 'AK' then 'Alaska'
                              when state_de = 'AL' then 'Alabama'
                              when state_de = 'AR' then 'Arkansas'
                              when state_de = 'AZ' then 'Arizona'
                              when state_de = 'CA' then 'California'
                              when state_de = 'CO' then 'Colorado'
                              when state_de = 'CT' then 'Connecticut'
                              when state_de = 'DE' then 'Delaware'
                              when state_de = 'FL' then 'Florida'
                              when state_de = 'GA' then 'Georgia'
                              when state_de = 'HI' then 'Hawaii'
                              when state_de = 'IA' then 'Iowa'
                              when state_de = 'ID' then 'Idaho'
                              when state_de = 'IL' then 'Illinois'
                              when state_de = 'IN' then 'Indiana'
                              when state_de = 'KS' then 'Kansas'
                              when state_de = 'KY' then 'Kentucky'
                              when state_de = 'LA' then 'Louisiana'
                              when state_de = 'MA' then 'Massachusetts'
                              when state_de = 'MD' then 'Maryland'
                              when state_de = 'ME' then 'Maine'
                              when state_de = 'MI' then 'Michigan'
                              when state_de = 'MN' then 'Minnesota'
                              when state_de = 'MO' then 'Missouri'
                              when state_de = 'MS' then 'Mississippi'
                              when state_de = 'MT' then 'Montana'
                              when state_de = 'NC' then 'North Carolina'
                              when state_de = 'ND' then 'North Dakota'
                              when state_de = 'NE' then 'Nebraska'
                              when state_de = 'NH' then 'New Hampshire'
                              when state_de = 'NJ' then 'New Jersey'
                              when state_de = 'NM' then 'New Mexico'
                              when state_de = 'NV' then 'Nevada'
                              when state_de = 'NY' then 'New York'
                              when state_de = 'OH' then 'Ohio'
                              when state_de = 'OK' then 'Oklahoma'
                              when state_de = 'OR' then 'Oregon'
                              when state_de = 'PA' then 'Pennsylvania'
                              when state_de = 'RI' then 'Rhode Island'
                              when state_de = 'SC' then 'South Carolina'
                              when state_de = 'SD' then 'South Dakota'
                              when state_de = 'TN' then 'Tennessee'
                              when state_de = 'TX' then 'Texas'
                              when state_de = 'UT' then 'Utah'
                              when state_de = 'VA' then 'Virginia'
                              when state_de = 'VT' then 'Vermont'
                              when state_de = 'WA' then 'Washington'
                              when state_de = 'WI' then 'Wisconsin'
                              when state_de = 'WV' then 'West Virginia'
                              when state_de = 'WY' then 'Wyoming'
                         end state_full_name_de;
                         

-- ERROR:  1267 - Illegal mix of collations
--SOLUTION: MAKE THE CHARACTER SETS MATCH BETWEEN JOINED TABLES

SELECT table_schema, table_name, column_name, character_set_name, collation_name
FROM information_schema.columns
where table_schema = 'project2'
and table_name in ('disch_lookup_final','drug_deaths')
ORDER BY table_schema, table_name,ordinal_position; 

ALTER TABLE drug_deaths CONVERT TO CHARACTER SET cp850 COLLATE 'cp850_general_ci';                         


---FINAL QUERY (TAKES TOO LONG, > 5 MINUTES)
select
  b.year_de,
  a.state_de,
  a.deaths,
  sum(case when b.gender_de = 'MALE' then 1 else 0 end) male_count,
  sum(case when b.gender_de = 'FEMALE' then 1 else 0 end) female_count,
  sum(case when b.reason_de = 'Complete' then 1 else 0 end) tx_complete,
  sum(case when b.reason_de = 'Incomplete' then 1 else 0 end) tx_incomplete
from
  drug_deaths a,
  disch_lookup_final b
where
  upper(a.state_full_name_de) = upper(b.stfips_de)
group by
  b.year_de,
  a.state_de,
  a.deaths
order by
  a.state_full_name_de;

---just create the table
create table map_viz as
select
  b.year_de,
  a.state_full_name_de,
  a.deaths,
  sum(case when b.gender_de = 'MALE' then 1 else 0 end) male_count,
  sum(case when b.gender_de = 'FEMALE' then 1 else 0 end) female_count,
  sum(case when b.reason_de = 'Complete' then 1 else 0 end) tx_complete,
  sum(case when b.reason_de = 'Incomplete' then 1 else 0 end) tx_incomplete
from
  drug_deaths a,
  disch_lookup_final b
where
  upper(a.state_full_name_de) = upper(b.stfips_de)
group by
  b.year_de,
  a.state_full_name_de,
  a.deaths
order by
  a.state_full_name_de;



--########################################################################################
--   ______           _  __      ___                 _ _          _   _                 
--  |  ____|         | | \ \    / (_)               | (_)        | | (_)                
--  | |__   _ __   __| |  \ \  / / _ ___ _   _  __ _| |_ ______ _| |_ _  ___  _ __  ___ 
--  |  __| | '_ \ / _` |   \ \/ / | / __| | | |/ _` | | |_  / _` | __| |/ _ \| '_ \/ __|
--  | |____| | | | (_| |    \  /  | \__ \ |_| | (_| | | |/ / (_| | |_| | (_) | | | \__ \
--  |______|_| |_|\__,_|     \/   |_|___/\__,_|\__,_|_|_/___\__,_|\__|_|\___/|_| |_|___/
--                                                                                      
--########################################################################################


-----------------------------------------------
--drug deaths by region
-----------------------------------------------  
  
--WILL BE DIFFICULT TO MAP  
select
  region,
  sum(deaths) total_deaths
from
  drug_deaths
group by
  region;  
  

-----------------------------------------------
--most popular substance
-----------------------------------------------
select
 sub1_de,
 count(*)
 from
   adm_lookups
group by
  sub1_de
order by count(*) desc;


-----------------------------------------------
--pct by gender
-----------------------------------------------

--Error Code: 1206. The total number of locks exceeds the lock table size
--bummer this won't work, hit error in lock table (basically too much data, value has to be increased)
--Error Code 1206 solved.

--#ORIGINAL SYNTAX
---create table mf_counts select
---  year_de
---  sum( case when gender = 1 then 1 else 0 end ) male_count,
---  sum( case when gender = 2 then 1 else 0 end ) female_count
---from
---  adm_lookups
---  where year_de = '2016';
---
-----graph this, pct of male vs. female addicts 2016
---select
---  round(((male_count /(male_count + female_count)) * 100), 2) 'male_addicts_pct',
---  round(((female_count /(male_count + female_count)) * 100), 2) 'female_addicts_pct'
---from
---  mf_counts
---where
---  year_de = '2016';

--MODIFIED FOR JAMUNA
set @varYear='2016';

select
  x.year_de,
  round(((x.male_count /(x.male_count + x.female_count)) * 100), 2) 'male_addicts_pct',
  round(((x.female_count /(x.male_count + x.female_count)) * 100), 2) 'female_addicts_pct'
from
(
  select
    year_de,
    sum( case when gender = 1 then 1 else 0 end ) male_count,
    sum( case when gender = 2 then 1 else 0 end ) female_count
  from
    adm_lookups
    where year_de = @varYear
) x;


-----------------------------------------------
--veteran status as a pct of all admits for year
-----------------------------------------------

--old syntax
--create table vet_status as
--select
--year_de,
--sum(case when vet_de = 'YES' then 1 else 0 end) 'VETERAN',
--sum(case when vet_de = 'NO' then 1 else 0 end) 'NON_VETERAN'
--FROM
--ADM_LOOKUPS
--where year_de = '2016';
--
----graph this, pct of vet vs. non-vet addicts 2016
--select
--  year_de,
--  round(((VETERAN /(VETERAN + NON_VETERAN)) * 100), 2) 'VETERAN_PCT',
--  round(((NON_VETERAN /(VETERAN + NON_VETERAN)) * 100), 2) 'NON_VETERAN_PCT'
--from
--  vet_status
--where
--  year_de = '2016';
  
  
  
--changed below for Jamuna's code to work
select
  x.year_de,
  round(((x.VETERAN /(x.VETERAN + x.NON_VETERAN)) * 100), 2) 'VETERAN_PCT',
  round(((x.NON_VETERAN /(x.VETERAN + x.NON_VETERAN)) * 100), 2) 'NON_VETERAN_PCT'
from
(
  select
    year_de,
    sum(case when vet_de = 'YES' then 1 else 0 end) 'VETERAN',
    sum(case when vet_de = 'NO' then 1 else 0 end) 'NON_VETERAN'
  FROM
    ADM_LOOKUPS
  where year_de = @varYear
)x ;  

-----------------------------------------------
--top drug of choice for vets
-----------------------------------------------

select
  vet_de,
  sub1_de,
  count(*)
from
  adm_lookups
where
  vet_de = 'YES'
group by
  vet_de,
  sub1_de
order by
  count(*) desc;

-----------------------------------------------
--most popular substance by age and region
-----------------------------------------------

select
  year_de,
  sub1_de,
  region_de,
  age_de,
  count(*)
from
  adm_lookups
group by
  year_de,
  sub1_de,
  region_de,
  age_de
order by
  region_de, age_de, count(*) desc;


-----------------------------------------------
--most common method for entering TX
-----------------------------------------------

select
  year_de,
  psource_de,
  count(*)
from  
  adm_lookups
group by  
  year_de,
  psource_de
order by
  year_de asc, count(*) desc;
  

-----------------------------------------------
--what is the most frequent age group for FIRST
--time use of a drug
-----------------------------------------------

select
  year_de,
  frstuse1_de,
  count(*)
from  
  adm_lookups
group by  
  year_de,
  frstuse1_de
order by
  year_de asc, count(*) desc;
 

-----------------------------------------------
--type of tx available in state
--Q1 from Anna's word doc
-----------------------------------------------

select distinct
  year_de,
  stfips_de,
  services_d_de
from  
  disch_lookups
order by
  year_de,
  stfips_de,
  services_d_de;
  
 
--put the above into a count (8 is max -> distinct of services_d_de) 
select 
  year_de,
  stfips_de,
  count(distinct services_d_de) 'number_of_services_provided_at_dischg'
from  
  disch_lookups
group by
  year_de, stfips_de;
  
--which states offers the most discharge tx services
select 
  year_de,
  stfips_de,
  count(distinct services_d_de) 'number_of_services_provided_at_dischg'
from  
  disch_lookups
group by
  year_de, stfips_de
order by
  count(distinct services_d_de) desc, 
  stfips_de asc;


-----------------------------------------------
--What types of treatment are the least and the most effective, and where
--Q2 from Anna's word doc
-----------------------------------------------

--this is one is not very easy to answer!
--rank function would help but not supported for mysql v 5.7
select
  year_de,
  services_d_de,
  reason_de,
  region_de,
  case when reason_de in ('DEATH','DROPPED OUT OF TREATMENT','INCARCERATED','TERMINATED BY FACILITY') THEN 'UNSUCCESSFUL'
       when reason_de = 'TREATMENT COMPLETED' THEN 'SUCCESSFUL'
  ELSE 'UNDETERMINED'
  END SUCCESS_EVAL,
  count(*)
from
  disch_lookups
group by
  year_de,
  services_d_de,
  reason_de,
  region_de
order by
  region_de,
  count(*) desc,
  success_eval,
  reason_de,
  services_d_de;

-----------------------------------------------
--Q3 from Anna's word doc
--Where are located the least effective treatments
-----------------------------------------------

--rank function would help but not supported for mysql v 5.7
select
  year_de,
  services_d_de,
  reason_de,
  region_de,
  case when reason_de in ('DEATH','DROPPED OUT OF TREATMENT','INCARCERATED','TERMINATED BY FACILITY') THEN 'UNSUCCESSFUL'
       when reason_de = 'TREATMENT COMPLETED' THEN 'SUCCESSFUL'
  ELSE 'UNDETERMINED'
  END SUCCESS_EVAL,
  count(*)
from
  disch_lookups
where
  reason_de in ('DEATH','DROPPED OUT OF TREATMENT','INCARCERATED','TERMINATED BY FACILITY')
group by
  year_de,
  services_d_de,
  reason_de,
  region_de
order by
  count(*) desc;

-----------------------------------------------
--Q4 from Anna's word doc
--Does the length of stay correlates with outcome of the treatment?
-----------------------------------------------

select
  los_de,
  hlthins_de,
  count(*) 'total_count'
from
  disch_lookups
group by
  los_de,
  hlthins_de
order by
  count(*) desc;
  

-----------------------------------------------
--Q5 from Anna's word doc
--Does age correlates with the outcome of the treatment?
-----------------------------------------------

create table age_group_discharge_reason
select
  reason_de,
  age_de,
  count(*) 'total_count'
from
  disch_lookups
group by
  reason_de,
  age_de;
  
--is this graphable?
select 
  age_de,
  reason_de,
  total_count
from 
  age_group_discharge_reason
group by
  age_de,
  reason_de
order by
  age_de,
  total_count desc;    


-----------------------------------------------
--Q6 from Anna's word doc
--Does primary drug of choice correlates with AGE?
-----------------------------------------------

select
  year_de,
  sub1_de,
  region_de,
  age_de,
  count(*)
from
  adm_lookups
group by
  year_de,
  sub1_de,
  region_de,
  age_de
order by
  region_de, age_de, count(*) desc;


-----------------------------------------------
--Q7 from Anna's word doc
-----------------------------------------------





-----------------------------------------------
--Q8 from Anna's word doc
-----------------------------------------------





-----------------------------------------------
--Q9 from Anna's word doc
-----------------------------------------------





-----------------------------------------------
--Q10 from Anna's word doc
-----------------------------------------------





-----------------------------------------------
--Q11 from Anna's word doc
-----------------------------------------------





-----------------------------------------------
--Q12 from Anna's word doc
-----------------------------------------------





-----------------------------------------------
--Q13 from Anna's word doc
-----------------------------------------------





-----------------------------------------------
--Q15 Is there correlation between the drug of choice or diagnosis and education?
-----------------------------------------------

--most popular drug
select 
  sub1_de,
  educ_de,
  count(*)
from 
  adm_lookups
group by
  sub1_de,
  educ_de
order by
  count(*) desc;

--looking at highest value by education
select 
  educ_de,
  sub1_de,
  count(*)
from 
  adm_lookups
group by
  educ_de,
  sub1_de
order by
  educ_de,
  count(*) desc;

--sad that heroin is the #1 choice for education < 8 years :(


-----------------------------------------------
--
-----------------------------------------------





-----------------------------------------------
--
-----------------------------------------------





-----------------------------------------------
--treatment completed by state
-----------------------------------------------

select
  region_de region, 
  stfips_de state,
  count(*) 'value'
from
  disch_lookups
where reason_de = 'TREATMENT COMPLETED'
group by
   region_de, 
  stfips_de;



-----------------------------------------------
--primary drug by state
-----------------------------------------------

select 
  stfips_de state,
  sub1_de primary_drug,
  count(*) 'value'
from
  adm_lookups
group by
  stfips_de,
  sub1_de
order by
  stfips_de, count(*) desc;


-----------------------------------------------
--heroin deaths by age
-----------------------------------------------

SELECT 
  age_de 'age_group', 
  sub1_de 'primary_drug',
  reason_de 'discharge_reason',
  count(*)
FROM 
  disch_lookups 
WHERE 
  sub1_de = 'HEROIN'
  and reason_de = 'DEATH'
group by
  age_de,
  sub1_de,
  reason_de
order by
  age;

--------------------------------------------------
--
--------------------------------------------------

--ORIGINAL SYNTAX
--create table tx_completed
--as 
--select
-- frstuse1_de 'age_started',
-- count(reason_de) 'treatment_completed'
--from
--  disch_lookups
--where
--  reason_de = 'TREATMENT COMPLETED'
--group by
--  frstuse1_de;
--
--
--create table tx_incomplete
--as 
--select
-- frstuse1_de 'age_started',
-- count(reason_de) 'treatment_incomplete'
--from
--  disch_lookups
--where
--  reason_de != 'TREATMENT COMPLETED'
--group by
--  frstuse1_de;
--
--select
--  a.age_started,
--  sum(a.treatment_completed) treatment_completed,
--  sum(b.treatment_incomplete) treatment_incomplete
--from
--  tx_completed a,
--  tx_incomplete b
--where
--  a.age_started = b.age_started
--group by
--  a.age_started;
  
  
--changed to work for Jamuna  
select
  a.age_started,
  sum(a.treatment_completed) treatment_completed,
  sum(b.treatment_incomplete) treatment_incomplete
from
  (  
    select
     frstuse1_de 'age_started',
     count(reason_de) 'treatment_completed'
    from
      disch_lookups
    where
      reason_de = 'TREATMENT COMPLETED'
    group by
      frstuse1_de
   ) a,
    (select
      frstuse1_de 'age_started',
      count(reason_de) 'treatment_incomplete'
     from
       disch_lookups
     where
       reason_de != 'TREATMENT COMPLETED'
     group by
       frstuse1_de
     ) b
where
  a.age_started = b.age_started
group by
  a.age_started;   








  
-----------------------------------------
--admissions_raw_recoded
-----------------------------------------

create table admissions_raw_recoded as select
   caseid 
  ,case when stfips = 1  then "ALABAMA"
        when stfips = 2  then "ALASKA"
        when stfips = 4  then "ARIZONA"
        when stfips = 5  then "ARKANSAS"
        when stfips = 6  then "CALIFORNIA"
        when stfips = 8  then "COLORADO"
        when stfips = 9  then "CONNECTICUT"
        when stfips = 10 then "DELAWARE"
        when stfips = 11 then "DISTRICT OF COLUMBIA"
        when stfips = 12 then "FLORIDA"
        when stfips = 13 then "GEORGIA"
        when stfips = 15 then "HAWAII"
        when stfips = 16 then "IDAHO"
        when stfips = 17 then "ILLINOIS"
        when stfips = 18 then "INDIANA"
        when stfips = 19 then "IOWA"
        when stfips = 20 then "KANSAS"
        when stfips = 21 then "KENTUCKY"
        when stfips = 22 then "LOUISIANA"
        when stfips = 23 then "MAINE"
        when stfips = 24 then "MARYLAND"
        when stfips = 25 then "MASSACHUSETTS"
        when stfips = 26 then "MICHIGAN"
        when stfips = 27 then "MINNESOTA"
        when stfips = 28 then "MISSISSIPPI"
        when stfips = 29 then "MISSOURI"
        when stfips = 30 then "MONTANA"
        when stfips = 31 then "NEBRASKA"
        when stfips = 32 then "NEVADA"
        when stfips = 33 then "NEW HAMPSHIRE"
        when stfips = 34 then "NEW JERSEY"
        when stfips = 35 then "NEW MEXICO"
        when stfips = 36 then "NEW YORK"
        when stfips = 37 then "NORTH CAROLINA"
        when stfips = 38 then "NORTH DAKOTA"
        when stfips = 39 then "OHIO"
        when stfips = 40 then "OKLAHOMA"
        when stfips = 42 then "PENNSYLVANIA"
        when stfips = 44 then "RHODE ISLAND"
        when stfips = 46 then "SOUTH DAKOTA"
        when stfips = 47 then "TENNESSEE"
        when stfips = 48 then "TEXAS"
        when stfips = 49 then "UTAH"
        when stfips = 50 then "VERMONT"
        when stfips = 51 then "VIRGINIA"
        when stfips = 53 then "WASHINGTON"
        when stfips = 55 then "WISCONSIN"
        when stfips = 56 then "WYOMING"
        when stfips = 72 then "PUERTO RICO"
   else "Undefined"
   end stfips_de
  ,case when age = 1 then "12-14" 
        when age = 2 then "15-17" 
        when age = 3 then "18-20" 
        when age = 4 then "21-24" 
        when age = 5 then "25-29" 
        when age = 6 then "30-34" 
        when age = 7 then "35-39" 
        when age = 8 then "40-44" 
        when age = 9 then "45-49" 
        when age = 10 then "50-54"
        when age = 11 then "55-64"
        when age = 12 then "65 and older"
    else "Undefined"
    end age_de
  ,case when services = 1 then "DETOX, 24 HR, HOSPITAL INPATIENT"
        when services = 2 then "DETOX, 24 HR, FREE-STANDING RESIDENTIAL"
        when services = 3 then "REHAB/RES, HOSPITAL (NON-DETOX)"
        when services = 4 then "REHAB/RES, SHORT TERM (30 DAYS OR FEWER)"
        when services = 5 then "REHAB/RES, LONG TERM (MORE THAN 30 DAYS)"
        when services = 6 then "AMBULATORY, INTENSIVE OUTPATIENT"
        when services = 7 then "AMBULATORY, NON-INTENSIVE OUTPATIENT"
        when services = 8 then "AMBULATORY, DETOXIFICATION"
   else "Undefined"
   end services_de
  ,case when sub1 = 1  then "NONE"
        when sub1 = 2  then "ALCOHOL"
        when sub1 = 3  then "COCAINE/CRACK"
        when sub1 = 4  then "MARIJUANA/HASHISH"
        when sub1 = 5  then "HEROIN"
        when sub1 = 6  then "NON-PRESCRIPTION METHADONE"
        when sub1 = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub1 = 8  then "PCP"
        when sub1 = 9  then "OTHER HALLUCINOGENS"
        when sub1 = 10 then "METHAMPHETAMINE"
        when sub1 = 11 then "OTHER AMPHETAMINES"
        when sub1 = 12 then "OTHER STIMULANTS"
        when sub1 = 13 then "BENZODIAZEPINES"
        when sub1 = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub1 = 15 then "BARBITURATES"
        when sub1 = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub1 = 17 then "INHALANTS"
        when sub1 = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub1 = 19 then "OTHER"
    else "Undefined"
        end sub1_de
  ,case when sub2 = 1  then "NONE"
        when sub2 = 2  then "ALCOHOL"
        when sub2 = 3  then "COCAINE/CRACK"
        when sub2 = 4  then "MARIJUANA/HASHISH"
        when sub2 = 5  then "HEROIN"
        when sub2 = 6  then "NON-PRESCRIPTION METHADONE"
        when sub2 = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub2 = 8  then "PCP"
        when sub2 = 9  then "OTHER HALLUCINOGENS"
        when sub2 = 10 then "METHAMPHETAMINE"
        when sub2 = 11 then "OTHER AMPHETAMINES"
        when sub2 = 12 then "OTHER STIMULANTS"
        when sub2 = 13 then "BENZODIAZEPINES"
        when sub2 = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub2 = 15 then "BARBITURATES"
        when sub2 = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub2 = 17 then "INHALANTS"
        when sub2 = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub2 = 19 then "OTHER"
    else "Undefined"
    end sub2_de
  ,case when sub3 = 1  then "NONE"
        when sub3 = 2  then "ALCOHOL"
        when sub3 = 3  then "COCAINE/CRACK"
        when sub3 = 4  then "MARIJUANA/HASHISH"
        when sub3 = 5  then "HEROIN"
        when sub3 = 6  then "NON-PRESCRIPTION METHADONE"
        when sub3 = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub3 = 8  then "PCP"
        when sub3 = 9  then "OTHER HALLUCINOGENS"
        when sub3 = 10 then "METHAMPHETAMINE"
        when sub3 = 11 then "OTHER AMPHETAMINES"
        when sub3 = 12 then "OTHER STIMULANTS"
        when sub3 = 13 then "BENZODIAZEPINES"
        when sub3 = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub3 = 15 then "BARBITURATES"
        when sub3 = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub3 = 17 then "INHALANTS"
        when sub3 = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub3 = 19 then "OTHER"
    else "Undefined"
    end sub3_de
  ,case when detcrim = 1   then "STATE/FEDERAL COURT"
        when detcrim = 2   then "FORMAL ADJUDICATION PROCESS"
        when detcrim = 3   then "PROBATION/PAROLE"
        when detcrim = 4   then "OTHER RECOGNIZED LEGAL ENTITY"
        when detcrim = 5   then "DIVERSIONARY PROGRAM"
        when detcrim = 6   then "PRISON"
        when detcrim = 7   then "DUI/DWI"
        when detcrim = 8   then "OTHER"
        when detcrim = -9  then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end detcrim_de
  ,case when noprior = 0 then "NO PRIOR TREATMENT EPISODE"
        when noprior = 1 then "ONE AND MORE PRIOR TREATMENT EPISODES"
        when noprior = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end noprior_de
  ,case when psource = 1  then "INDIVIDUAL (INCLUDES SELF-REFERRAL)"
        when psource = 2  then "ALCOHOL/DRUG USE CARE PROVIDER"
        when psource = 3  then "OTHER HEALTH CARE PROVIDER"
        when psource = 4  then "SCHOOL (EDUCATIONAL)"
        when psource = 5  then "EMPLOYER/EAP"
        when psource = 6  then "OTHER COMMUNITY REFERRAL"
        when psource = 7  then "COURT/CRIMINAL JUSTICE REFERRAL / DUI / DWI"
        when psource = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end psource_de
  ,case when arrests = 0 then "NONE"
        when arrests = 1 then "ONCE"
        when arrests = 2 then "TWO OR MORE TIMES"
        when arrests = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end arrests_de
  ,case when race = 1  then "ALASKA NATIVE (ALEUT, ESKIMO, INDIAN)"
        when race = 2  then "AMERICAN INDIAN (OTHER THAN ALASKA NATIVE)"
        when race = 3  then "ASIAN OR PACIFIC ISLANDER"
        when race = 4  then "BLACK OR AFRICAN AMERICAN"
        when race = 5  then "WHITE"
        when race = 6  then "ASIAN"
        when race = 7  then "OTHER SINGLE RACE"
        when race = 8  then "TWO OR MORE RACES"
        when race = 9  then "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER"
        when race = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end race_de  
  ,case when ethnic = 1  then "PUERTO RICAN"
        when ethnic = 2  then "MEXICAN"
        when ethnic = 3  then "CUBAN OR OTHER SPECIFIC HISPANIC"
        when ethnic = 4  then "NOT OF HISPANIC OR LATINO ORIGIN"
        when ethnic = 5  then "HISPANIC OR LATINO, SPECIFIC ORIGIN NOT SPECIFIED"
        when ethnic = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end ethnic_de
  ,case when gender = 1  then "MALE"
        when gender = 2  then "FEMALE"
        when gender = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end gender_de  
  ,case when educ = 1  then "8 YEARS OR LESS"
        when educ = 2  then "9-11"
        when educ = 3  then "12 (GED)"
        when educ = 4  then "13-15"
        when educ = 5  then "16 OR MORE"
        when educ = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end educ_de
   ,case when employ = 1  then "FULL TIME"
        when employ = 2  then "PART TIME"
        when employ = 3  then "UNEMPLOYED"
        when employ = 4  then "NOT IN LABOR FORCE"
        when employ = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end employ_de  
  ,case when methuse =  1 then "YES"
        when methuse =  2 then "NO"
        when methuse = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end methuse_de
  ,case when psyprob =  1 then "YES"
        when psyprob =  2 then "NO"
        when psyprob = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end psyprob_de  
  ,case when preg =  1 then "YES"
        when preg =  2 then "NO"
        when preg = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end preg_de   
  ,case when vet =  1 then "YES"
        when vet =  2 then "NO"
        when vet = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end vet_de
  ,case when livarag = 1  then "HOMELESS"
        when livarag = 2  then "DEPENDENT LIVING"
        when livarag = 3  then "INDEPENDENT LIVING"
        when livarag = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end livarag_de  
  ,case when priminc = 1  then "WAGES/SALARY"
        when priminc = 2  then "PUBLIC ASSISTANCE"
        when priminc = 3  then "RETIREMENT/PENSION, DISABILITY"
        when priminc = 4  then "OTHER"
        when priminc = 5  then "NONE"
        when priminc = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end priminc_de  
  ,case when hlthins = 1  then "PRIVATE INSURANCE, BLUE CROSS/BLUE SHIELD, HMO"
        when hlthins = 2  then "MEDICAID"
        when hlthins = 3  then "MEDICARE, OTHER (E.G. TRICARE, CHAMPUS)"
        when hlthins = 4  then "NONE"
        when hlthins = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end hlthins_de  
  ,case when primpay = 1  then "SELF-PAY"
        when primpay = 2  then "PRIVATE INSURANCE (BLUE CROSS/BLUE SHIELD, OTHER HEALTH INSURANCE, WORKERS COMPENSATION)"
        when primpay = 3  then "MEDICARE"
        when primpay = 4  then "MEDICAID"
        when primpay = 5  then "OTHER GOVERNMENT PAYMENTS"
        when primpay = 6  then "NO CHARGE (FREE, CHARITY, SPECIAL RESEARCH, TEACHING)"
        when primpay = 7  then "OTHER"
        when primpay = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end primpay_de  
  ,case when detnlf = 1  then "HOMEMAKER"
        when detnlf = 2  then "STUDENT"
        when detnlf = 3  then "RETIRED, DISABLED"
        when detnlf = 4  then "RESIDENT OF INSTITUTION"
        when detnlf = 5  then "OTHER"
        when detnlf = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end detnlf_de
  ,case when marstat = 1  then "NEVER MARRIED"
        when marstat = 2  then "NOW MARRIED"
        when marstat = 3  then "SEPARATED"
        when marstat = 4  then "DIVORCED, WIDOWED"
        when marstat = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end marstat_de
  ,case when daywait = 0  then "0"
        when daywait = 1  then "1-7"
        when daywait = 2  then "8-14"
        when daywait = 3  then "15-30"
        when daywait = 4  then "31 and more"
        when daywait = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end daywait_de  
  ,case when route1 = 1  then "ORAL"
        when route1 = 2  then "SMOKING"
        when route1 = 3  then "INHALATION"
        when route1 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route1 = 5  then "OTHER"
        when route1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route1_de
  ,case when freq1 = 1  then "NO USE IN THE PAST MONTH"
        when freq1 = 2  then "SOME USE"
        when freq1 = 3  then "DAILY USE"
        when freq1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq1_de
  ,case when frstuse1 = 1  then "11 AND UNDER"
        when frstuse1 = 2  then "12 TO 14 YEARS"
        when frstuse1 = 3  then "15 TO 17 YEARS"
        when frstuse1 = 4  then "18 TO 20 YEARS"
        when frstuse1 = 5  then "21 TO 24 YEARS"
        when frstuse1 = 6  then "25 TO 29 YEARS"
        when frstuse1 = 7  then "30 AND OVER"
        when frstuse1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end frstuse1_de
  ,case when route2 = 1  then "ORAL"
        when route2 = 2  then "SMOKING"
        when route2 = 3  then "INHALATION"
        when route2 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route2 = 5  then "OTHER"
        when route2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route2_de
  ,case when freq2 = 1  then "NO USE IN THE PAST MONTH"
        when freq2 = 2  then "SOME USE"
        when freq2 = 3  then "DAILY USE"
        when freq2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq2_de  
  ,case when frstuse2 = 1  then "11 AND UNDER"
        when frstuse2 = 2  then "12 TO 14 YEARS"
        when frstuse2 = 3  then "15 TO 17 YEARS"
        when frstuse2 = 4  then "18 TO 20 YEARS"
        when frstuse2 = 5  then "21 TO 24 YEARS"
        when frstuse2 = 6  then "25 TO 29 YEARS"
        when frstuse2 = 7  then "30 AND OVER"
        when frstuse2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end frstuse2_de  
  ,case when route3 = 1  then "ORAL"
        when route3 = 2  then "SMOKING"
        when route3 = 3  then "INHALATION"
        when route3 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route3 = 5  then "OTHER"
        when route3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route3_de
  ,case when freq3 = 1  then "NO USE IN THE PAST MONTH"
        when freq3 = 2  then "SOME USE"
        when freq3 = 3  then "DAILY USE"
        when freq3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq3_de
  ,case when frstuse3 = 1  then "11 AND UNDER"
        when frstuse3 = 2  then "12 TO 14 YEARS"
        when frstuse3 = 3  then "15 TO 17 YEARS"
        when frstuse3 = 4  then "18 TO 20 YEARS"
        when frstuse3 = 5  then "21 TO 24 YEARS"
        when frstuse3 = 6  then "25 TO 29 YEARS"
        when frstuse3 = 7  then "30 AND OVER"
        when frstuse3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end frstuse3_de  
  ,case when freq_atnd_self_help = 1  then "NO ATTENDANCE"
        when freq_atnd_self_help = 2  then "1-3 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 3  then "4-7 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 4  then "8-30 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 5  then "SOME ATTENDANCE, FREQUENCY IS UNKNOWN"
        when freq_atnd_self_help = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq_atnd_self_help_de
   ,case when dsmcrit = 1  then "ALCOHOL-INDUCED DISORDER"
        when dsmcrit = 2  then "SUBSTANCE-INDUCED DISORDER"
        when dsmcrit = 3  then "ALCOHOL INTOXICATION"
        when dsmcrit = 4  then "ALCOHOL DEPENDENCE"
        when dsmcrit = 5  then "OPIOID DEPENDENCE"
        when dsmcrit = 6  then "COCAINE DEPENDENCE"
        when dsmcrit = 7  then "CANNABIS DEPENDENCE"
        when dsmcrit = 8  then "OTHER SUBSTANCE DEPENDENCE"
        when dsmcrit = 9  then "ALCOHOL ABUSE"
        when dsmcrit = 10 then "CANNABIS ABUSE"
        when dsmcrit = 11 then "OTHER SUBSTANCE ABUSE"
        when dsmcrit = 12 then "OPIOID ABUSE"
        when dsmcrit = 13 then "COCAINE ABUSE"
        when dsmcrit = 14 then "ANXIETY DISORDERS"
        when dsmcrit = 15 then "DEPRESSIVE DISORDERS"
        when dsmcrit = 16 then "SCHIZOPHRENIA/OTHER PSYCHOTIC DISORDERS"
        when dsmcrit = 17 then "BIPOLAR DISORDERS"
        when dsmcrit = 18 then "ATTENTION DEFICIT/DISRUPTIVE BEHAVIOR DISORDERS"
        when dsmcrit = 19 then "OTHER MENTAL HEALTH CONDITION"
        when dsmcrit = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID/NO OR DEFERRED DIAGNOSIS"
   else "Undefined"
   end dsmcrit_de
  ,case when alcflg = 0 then "SUBSTANCE NOT REPORTED"
        when alcflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end alcflg_de
  ,case when cokeflg = 0 then "SUBSTANCE NOT REPORTED"
        when cokeflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end cokeflg_de  
  ,case when marflg = 0 then "SUBSTANCE NOT REPORTED"
        when marflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end marflg_de  
  ,case when herflg = 0 then "SUBSTANCE NOT REPORTED"
        when herflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end herflg_de  
  ,case when methflg = 0 then "SUBSTANCE NOT REPORTED"
        when methflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end methflg_de  
  ,case when opsynflg = 0 then "SUBSTANCE NOT REPORTED"
        when opsynflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end opsynflg_de  
  ,case when pcpflg = 0 then "SUBSTANCE NOT REPORTED"
        when pcpflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end pcpflg_de  
  ,case when hallflg = 0 then "SUBSTANCE NOT REPORTED"
        when hallflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end hallflg_de
  ,case when mthamflg = 0 then "SUBSTANCE NOT REPORTED"
        when mthamflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end mthamflg_de  
  ,case when amphflg = 0 then "SUBSTANCE NOT REPORTED"
        when amphflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end amphflg_de  
  ,case when stimflg = 0 then "SUBSTANCE NOT REPORTED"
        when stimflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end stimflg_de  
  ,case when benzflg = 0 then "SUBSTANCE NOT REPORTED"
        when benzflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end benzflg_de  
  ,case when trnqflg = 0 then "SUBSTANCE NOT REPORTED"
        when trnqflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end trnqflg_de  
  ,case when barbflg = 0 then "SUBSTANCE NOT REPORTED"
        when barbflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end barbflg_de  
  ,case when sedhpflg = 0 then "SUBSTANCE NOT REPORTED"
        when sedhpflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end sedhpflg_de  
  ,case when inhflg = 0 then "SUBSTANCE NOT REPORTED"
        when inhflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end inhflg_de  
  ,case when otcflg = 0 then "SUBSTANCE NOT REPORTED"
        when otcflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end otcflg_de  
  ,case when otherflg = 0 then "SUBSTANCE NOT REPORTED"
        when otherflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end otherflg_de  
  ,case when division = 0 then "US JURISDICTION/TERRITORY"
        when division = 1 then "NEW ENGLAND"
        when division = 2 then "MID-ATLANTIC"
        when division = 3 then "EAST NORTH CENTRAL"
        when division = 4 then "WEST NORTH CENTRAL"
        when division = 5 then "SOUTH ATLANTIC"
        when division = 6 then "EAST SOUTH CENTRAL"
        when division = 7 then "WEST SOUTH CENTRAL"
        when division = 8 then "MOUNTAIN"
        when division = 9 then "PACIFIC"
   else "Undefine"
   end division_de
  ,case when region = 0 then "US JURISDICTION/TERRITORY"
        when region = 1 then "NORTHEAST"
        when region = 2 then "MIDWEST"
        when region = 3 then "SOUTH"
        when region = 4 then "WEST"
   else "Undefined"
   end region_de
  ,case when alcdrug = 0 then "NONE"
        when alcdrug = 1 then "ALCOHOL ONLY"
        when alcdrug = 2 then "OTHER DRUGS ONLY"
        when alcdrug = 3 then "ALCOHOL AND OTHER DRUGS"
   else "Undefined"
   end alcdrug_de
  ,year_de
  ,cbsa10 
  ,case when idu = 0  then "IDU NOT REPORTED"
        when idu = 1  then "IDU REPORTED"
        when idu = -9 then "NO SUBSTANCES REPORTED"
   else "Undefined"
   end idu_de  
FROM 
  admissions_raw;

alter table admissions_raw_recoded add adm_raw_recoded_pk_id int auto_increment primary key first;

-------------------------------------------
#-- discharges_raw_recoded
-------------------------------------------

create table discharges_raw_recoded
as select
   disyr
  ,caseid
  ,case when stfips = 1  then "ALABAMA"
        when stfips = 2  then "ALASKA"
        when stfips = 4  then "ARIZONA"
        when stfips = 5  then "ARKANSAS"
        when stfips = 6  then "CALIFORNIA"
        when stfips = 8  then "COLORADO"
        when stfips = 9  then "CONNECTICUT"
        when stfips = 10 then "DELAWARE"
        when stfips = 11 then "DISTRICT OF COLUMBIA"
        when stfips = 12 then "FLORIDA"
        when stfips = 13 then "GEORGIA"
        when stfips = 15 then "HAWAII"
        when stfips = 16 then "IDAHO"
        when stfips = 17 then "ILLINOIS"
        when stfips = 18 then "INDIANA"
        when stfips = 19 then "IOWA"
        when stfips = 20 then "KANSAS"
        when stfips = 21 then "KENTUCKY"
        when stfips = 22 then "LOUISIANA"
        when stfips = 23 then "MAINE"
        when stfips = 24 then "MARYLAND"
        when stfips = 25 then "MASSACHUSETTS"
        when stfips = 26 then "MICHIGAN"
        when stfips = 27 then "MINNESOTA"
        when stfips = 28 then "MISSISSIPPI"
        when stfips = 29 then "MISSOURI"
        when stfips = 30 then "MONTANA"
        when stfips = 31 then "NEBRASKA"
        when stfips = 32 then "NEVADA"
        when stfips = 33 then "NEW HAMPSHIRE"
        when stfips = 34 then "NEW JERSEY"
        when stfips = 35 then "NEW MEXICO"
        when stfips = 36 then "NEW YORK"
        when stfips = 37 then "NORTH CAROLINA"
        when stfips = 38 then "NORTH DAKOTA"
        when stfips = 39 then "OHIO"
        when stfips = 40 then "OKLAHOMA"
        when stfips = 42 then "PENNSYLVANIA"
        when stfips = 44 then "RHODE ISLAND"
        when stfips = 46 then "SOUTH DAKOTA"
        when stfips = 47 then "TENNESSEE"
        when stfips = 48 then "TEXAS"
        when stfips = 49 then "UTAH"
        when stfips = 50 then "VERMONT"
        when stfips = 51 then "VIRGINIA"
        when stfips = 53 then "WASHINGTON"
        when stfips = 55 then "WISCONSIN"
        when stfips = 56 then "WYOMING"
        when stfips = 72 then "PUERTO RICO"
   else "Undefined"
   end stfips_de
  ,case when age = 1 then "12-14" 
        when age = 2 then "15-17" 
        when age = 3 then "18-20" 
        when age = 4 then "21-24" 
        when age = 5 then "25-29" 
        when age = 6 then "30-34" 
        when age = 7 then "35-39" 
        when age = 8 then "40-44" 
        when age = 9 then "45-49" 
        when age = 10 then "50-54"
        when age = 11 then "55-64"
        when age = 12 then "65 and older"
    else "Undefined"
    end age_de  
  ,case when services = 1 then "DETOX, 24 HR, HOSPITAL INPATIENT"
        when services = 2 then "DETOX, 24 HR, FREE-STANDING RESIDENTIAL"
        when services = 3 then "REHAB/RES, HOSPITAL (NON-DETOX)"
        when services = 4 then "REHAB/RES, SHORT TERM (30 DAYS OR FEWER)"
        when services = 5 then "REHAB/RES, LONG TERM (MORE THAN 30 DAYS)"
        when services = 6 then "AMBULATORY, INTENSIVE OUTPATIENT"
        when services = 7 then "AMBULATORY, NON-INTENSIVE OUTPATIENT"
        when services = 8 then "AMBULATORY, DETOXIFICATION"
   else "Undefined"
   end services_de  
  ,case when sub1 = 1  then "NONE"
        when sub1 = 2  then "ALCOHOL"
        when sub1 = 3  then "COCAINE/CRACK"
        when sub1 = 4  then "MARIJUANA/HASHISH"
        when sub1 = 5  then "HEROIN"
        when sub1 = 6  then "NON-PRESCRIPTION METHADONE"
        when sub1 = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub1 = 8  then "PCP"
        when sub1 = 9  then "OTHER HALLUCINOGENS"
        when sub1 = 10 then "METHAMPHETAMINE"
        when sub1 = 11 then "OTHER AMPHETAMINES"
        when sub1 = 12 then "OTHER STIMULANTS"
        when sub1 = 13 then "BENZODIAZEPINES"
        when sub1 = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub1 = 15 then "BARBITURATES"
        when sub1 = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub1 = 17 then "INHALANTS"
        when sub1 = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub1 = 19 then "OTHER"
    else "Undefined"
        end sub1_de
  ,case when sub2 = 1  then "NONE"
        when sub2 = 2  then "ALCOHOL"
        when sub2 = 3  then "COCAINE/CRACK"
        when sub2 = 4  then "MARIJUANA/HASHISH"
        when sub2 = 5  then "HEROIN"
        when sub2 = 6  then "NON-PRESCRIPTION METHADONE"
        when sub2 = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub2 = 8  then "PCP"
        when sub2 = 9  then "OTHER HALLUCINOGENS"
        when sub2 = 10 then "METHAMPHETAMINE"
        when sub2 = 11 then "OTHER AMPHETAMINES"
        when sub2 = 12 then "OTHER STIMULANTS"
        when sub2 = 13 then "BENZODIAZEPINES"
        when sub2 = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub2 = 15 then "BARBITURATES"
        when sub2 = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub2 = 17 then "INHALANTS"
        when sub2 = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub2 = 19 then "OTHER"
    else "Undefined"
    end sub2_de
  ,case when sub3 = 1  then "NONE"
        when sub3 = 2  then "ALCOHOL"
        when sub3 = 3  then "COCAINE/CRACK"
        when sub3 = 4  then "MARIJUANA/HASHISH"
        when sub3 = 5  then "HEROIN"
        when sub3 = 6  then "NON-PRESCRIPTION METHADONE"
        when sub3 = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub3 = 8  then "PCP"
        when sub3 = 9  then "OTHER HALLUCINOGENS"
        when sub3 = 10 then "METHAMPHETAMINE"
        when sub3 = 11 then "OTHER AMPHETAMINES"
        when sub3 = 12 then "OTHER STIMULANTS"
        when sub3 = 13 then "BENZODIAZEPINES"
        when sub3 = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub3 = 15 then "BARBITURATES"
        when sub3 = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub3 = 17 then "INHALANTS"
        when sub3 = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub3 = 19 then "OTHER"
    else "Undefined"
    end sub3_de
  ,case when detcrim = 1   then "STATE/FEDERAL COURT"
        when detcrim = 2   then "FORMAL ADJUDICATION PROCESS"
        when detcrim = 3   then "PROBATION/PAROLE"
        when detcrim = 4   then "OTHER RECOGNIZED LEGAL ENTITY"
        when detcrim = 5   then "DIVERSIONARY PROGRAM"
        when detcrim = 6   then "PRISON"
        when detcrim = 7   then "DUI/DWI"
        when detcrim = 8   then "OTHER"
        when detcrim = -9  then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end detcrim_de
  ,case when noprior = 0 then "NO PRIOR TREATMENT EPISODE"
        when noprior = 1 then "ONE AND MORE PRIOR TREATMENT EPISODES"
        when noprior = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end noprior_de
  ,case when psource = 1  then "INDIVIDUAL (INCLUDES SELF-REFERRAL)"
        when psource = 2  then "ALCOHOL/DRUG USE CARE PROVIDER"
        when psource = 3  then "OTHER HEALTH CARE PROVIDER"
        when psource = 4  then "SCHOOL (EDUCATIONAL)"
        when psource = 5  then "EMPLOYER/EAP"
        when psource = 6  then "OTHER COMMUNITY REFERRAL"
        when psource = 7  then "COURT/CRIMINAL JUSTICE REFERRAL / DUI / DWI"
        when psource = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end psource_de
  ,case when arrests = 0 then "NONE"
        when arrests = 1 then "ONCE"
        when arrests = 2 then "TWO OR MORE TIMES"
        when arrests = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end arrests_de
  ,case when race = 1  then "ALASKA NATIVE (ALEUT, ESKIMO, INDIAN)"
        when race = 2  then "AMERICAN INDIAN (OTHER THAN ALASKA NATIVE)"
        when race = 3  then "ASIAN OR PACIFIC ISLANDER"
        when race = 4  then "BLACK OR AFRICAN AMERICAN"
        when race = 5  then "WHITE"
        when race = 6  then "ASIAN"
        when race = 7  then "OTHER SINGLE RACE"
        when race = 8  then "TWO OR MORE RACES"
        when race = 9  then "NATIVE HAWAIIAN OR OTHER PACIFIC ISLANDER"
        when race = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end race_de  
  ,case when ethnic = 1  then "PUERTO RICAN"
        when ethnic = 2  then "MEXICAN"
        when ethnic = 3  then "CUBAN OR OTHER SPECIFIC HISPANIC"
        when ethnic = 4  then "NOT OF HISPANIC OR LATINO ORIGIN"
        when ethnic = 5  then "HISPANIC OR LATINO, SPECIFIC ORIGIN NOT SPECIFIED"
        when ethnic = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end ethnic_de
  ,case when educ = 1  then "8 YEARS OR LESS"
        when educ = 2  then "9-11"
        when educ = 3  then "12 (GED)"
        when educ = 4  then "13-15"
        when educ = 5  then "16 OR MORE"
        when educ = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end educ_de
  ,case when employ = 1  then "FULL TIME"
        when employ = 2  then "PART TIME"
        when employ = 3  then "UNEMPLOYED"
        when employ = 4  then "NOT IN LABOR FORCE"
        when employ = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end employ_de  
  ,case when methuse =  1 then "YES"
        when methuse =  2 then "NO"
        when methuse = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end methuse_de
  ,case when psyprob =  1 then "YES"
        when psyprob =  2 then "NO"
        when psyprob = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end psyprob_de  
  ,case when preg =  1 then "YES"
        when preg =  2 then "NO"
        when preg = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end preg_de   
  ,case when vet =  1 then "YES"
        when vet =  2 then "NO"
        when vet = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end vet_de
  ,case when livarag = 1  then "HOMELESS"
        when livarag = 2  then "DEPENDENT LIVING"
        when livarag = 3  then "INDEPENDENT LIVING"
        when livarag = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end livarag_de
  ,case when priminc = 1  then "WAGES/SALARY"
        when priminc = 2  then "PUBLIC ASSISTANCE"
        when priminc = 3  then "RETIREMENT/PENSION, DISABILITY"
        when priminc = 4  then "OTHER"
        when priminc = 5  then "NONE"
        when priminc = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end priminc_de  
  ,case when hlthins = 1  then "PRIVATE INSURANCE, BLUE CROSS/BLUE SHIELD, HMO"
        when hlthins = 2  then "MEDICAID"
        when hlthins = 3  then "MEDICARE, OTHER (E.G. TRICARE, CHAMPUS)"
        when hlthins = 4  then "NONE"
        when hlthins = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end hlthins_de  
  ,case when primpay = 1  then "SELF-PAY"
        when primpay = 2  then "PRIVATE INSURANCE (BLUE CROSS/BLUE SHIELD, OTHER HEALTH INSURANCE, WORKERS COMPENSATION)"
        when primpay = 3  then "MEDICARE"
        when primpay = 4  then "MEDICAID"
        when primpay = 5  then "OTHER GOVERNMENT PAYMENTS"
        when primpay = 6  then "NO CHARGE (FREE, CHARITY, SPECIAL RESEARCH, TEACHING)"
        when primpay = 7  then "OTHER"
        when primpay = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end primpay_de
  ,case when detnlf = 1  then "HOMEMAKER"
        when detnlf = 2  then "STUDENT"
        when detnlf = 3  then "RETIRED, DISABLED"
        when detnlf = 4  then "RESIDENT OF INSTITUTION"
        when detnlf = 5  then "OTHER"
        when detnlf = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end detnlf_de
  ,case when marstat = 1  then "NEVER MARRIED"
        when marstat = 2  then "NOW MARRIED"
        when marstat = 3  then "SEPARATED"
        when marstat = 4  then "DIVORCED, WIDOWED"
        when marstat = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end marstat_de
  ,case when daywait = 0  then "0"
        when daywait = 1  then "1-7"
        when daywait = 2  then "8-14"
        when daywait = 3  then "15-30"
        when daywait = 4  then "31 and more"
        when daywait = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end daywait_de
  ,case when route1 = 1  then "ORAL"
        when route1 = 2  then "SMOKING"
        when route1 = 3  then "INHALATION"
        when route1 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route1 = 5  then "OTHER"
        when route1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route1_de
  ,case when freq1 = 1  then "NO USE IN THE PAST MONTH"
        when freq1 = 2  then "SOME USE"
        when freq1 = 3  then "DAILY USE"
        when freq1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq1_de
  ,case when frstuse1 = 1  then "11 AND UNDER"
        when frstuse1 = 2  then "12 TO 14 YEARS"
        when frstuse1 = 3  then "15 TO 17 YEARS"
        when frstuse1 = 4  then "18 TO 20 YEARS"
        when frstuse1 = 5  then "21 TO 24 YEARS"
        when frstuse1 = 6  then "25 TO 29 YEARS"
        when frstuse1 = 7  then "30 AND OVER"
        when frstuse1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end frstuse1_de
  ,case when route2 = 1  then "ORAL"
        when route2 = 2  then "SMOKING"
        when route2 = 3  then "INHALATION"
        when route2 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route2 = 5  then "OTHER"
        when route2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route2_de
  ,case when freq2 = 1  then "NO USE IN THE PAST MONTH"
        when freq2 = 2  then "SOME USE"
        when freq2 = 3  then "DAILY USE"
        when freq2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq2_de  
  ,case when frstuse2 = 1  then "11 AND UNDER"
        when frstuse2 = 2  then "12 TO 14 YEARS"
        when frstuse2 = 3  then "15 TO 17 YEARS"
        when frstuse2 = 4  then "18 TO 20 YEARS"
        when frstuse2 = 5  then "21 TO 24 YEARS"
        when frstuse2 = 6  then "25 TO 29 YEARS"
        when frstuse2 = 7  then "30 AND OVER"
        when frstuse2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end frstuse2_de  
  ,case when route3 = 1  then "ORAL"
        when route3 = 2  then "SMOKING"
        when route3 = 3  then "INHALATION"
        when route3 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route3 = 5  then "OTHER"
        when route3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route3_de
  ,case when freq3 = 1  then "NO USE IN THE PAST MONTH"
        when freq3 = 2  then "SOME USE"
        when freq3 = 3  then "DAILY USE"
        when freq3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq3_de
  ,case when frstuse3 = 1  then "11 AND UNDER"
        when frstuse3 = 2  then "12 TO 14 YEARS"
        when frstuse3 = 3  then "15 TO 17 YEARS"
        when frstuse3 = 4  then "18 TO 20 YEARS"
        when frstuse3 = 5  then "21 TO 24 YEARS"
        when frstuse3 = 6  then "25 TO 29 YEARS"
        when frstuse3 = 7  then "30 AND OVER"
        when frstuse3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end frstuse3_de
  ,case when freq_atnd_self_help = 1  then "NO ATTENDANCE"
        when freq_atnd_self_help = 2  then "1-3 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 3  then "4-7 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 4  then "8-30 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 5  then "SOME ATTENDANCE, FREQUENCY IS UNKNOWN"
        when freq_atnd_self_help = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq_atnd_self_help_de
  ,case when dsmcrit = 1  then "ALCOHOL-INDUCED DISORDER"
        when dsmcrit = 2  then "SUBSTANCE-INDUCED DISORDER"
        when dsmcrit = 3  then "ALCOHOL INTOXICATION"
        when dsmcrit = 4  then "ALCOHOL DEPENDENCE"
        when dsmcrit = 5  then "OPIOID DEPENDENCE"
        when dsmcrit = 6  then "COCAINE DEPENDENCE"
        when dsmcrit = 7  then "CANNABIS DEPENDENCE"
        when dsmcrit = 8  then "OTHER SUBSTANCE DEPENDENCE"
        when dsmcrit = 9  then "ALCOHOL ABUSE"
        when dsmcrit = 10 then "CANNABIS ABUSE"
        when dsmcrit = 11 then "OTHER SUBSTANCE ABUSE"
        when dsmcrit = 12 then "OPIOID ABUSE"
        when dsmcrit = 13 then "COCAINE ABUSE"
        when dsmcrit = 14 then "ANXIETY DISORDERS"
        when dsmcrit = 15 then "DEPRESSIVE DISORDERS"
        when dsmcrit = 16 then "SCHIZOPHRENIA/OTHER PSYCHOTIC DISORDERS"
        when dsmcrit = 17 then "BIPOLAR DISORDERS"
        when dsmcrit = 18 then "ATTENTION DEFICIT/DISRUPTIVE BEHAVIOR DISORDERS"
        when dsmcrit = 19 then "OTHER MENTAL HEALTH CONDITION"
        when dsmcrit = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID/NO OR DEFERRED DIAGNOSIS"
   else "Undefined"
   end dsmcrit_de
  ,case when services_d = 1 then "DETOX, 24 HR, HOSPITAL INPATIENT"
        when services_d = 2 then "DETOX, 24 HR, FREE-STANDING RESIDENTIAL"
        when services_d = 3 then "REHAB/RES, HOSPITAL (NON-DETOX)"
        when services_d = 4 then "REHAB/RES, SHORT TERM (30 DAYS OR FEWER)"
        when services_d = 5 then "REHAB/RES, LONG TERM (MORE THAN 30 DAYS)"
        when services_d = 6 then "AMBULATORY, INTENSIVE OUTPATIENT"
        when services_d = 7 then "AMBULATORY, NON-INTENSIVE OUTPATIENT"
        when services_d = 8 then "AMBULATORY, DETOXIFICATION"
    else "Undefined"
    end services_d_de
  ,case when reason = 1 then "TREATMENT COMPLETED"
        when reason = 2 then "DROPPED OUT OF TREATMENT"
        when reason = 3 then "TERMINATED BY FACILITY"
        when reason = 4 then "TRANSFERRED TO ANOTHER TREATMENT PROGRAM OR FACILITY"
        when reason = 5 then "INCARCERATED"
        when reason = 6 then "DEATH"
        when reason = 7 then "OTHER"
   else "Undefined"
   end reason_de
  ,case when reason = 1 then "TREATMENT COMPLETED"
   else "TREATMENT INCOMPLETE"
   end reason_class  
  ,case when sub1_d = 1  then "NONE"
        when sub1_d = 2  then "ALCOHOL"
        when sub1_d = 3  then "COCAINE/CRACK"
        when sub1_d = 4  then "MARIJUANA/HASHISH"
        when sub1_d = 5  then "HEROIN"
        when sub1_d = 6  then "NON-PRESCRIPTION METHADONE"
        when sub1_d = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub1_d = 8  then "PCP"
        when sub1_d = 9  then "OTHER HALLUCINOGENS"
        when sub1_d = 10 then "METHAMPHETAMINE"
        when sub1_d = 11 then "OTHER AMPHETAMINES"
        when sub1_d = 12 then "OTHER STIMULANTS"
        when sub1_d = 13 then "BENZODIAZEPINES"
        when sub1_d = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub1_d = 15 then "BARBITURATES"
        when sub1_d = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub1_d = 17 then "INHALANTS"
        when sub1_d = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub1_d = 19 then "OTHER"
    else "Undefined"
    end sub1_d_de
  ,case when sub2_d = 1  then "NONE"
        when sub2_d = 2  then "ALCOHOL"
        when sub2_d = 3  then "COCAINE/CRACK"
        when sub2_d = 4  then "MARIJUANA/HASHISH"
        when sub2_d = 5  then "HEROIN"
        when sub2_d = 6  then "NON-PRESCRIPTION METHADONE"
        when sub2_d = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub2_d = 8  then "PCP"
        when sub2_d = 9  then "OTHER HALLUCINOGENS"
        when sub2_d = 10 then "METHAMPHETAMINE"
        when sub2_d = 11 then "OTHER AMPHETAMINES"
        when sub2_d = 12 then "OTHER STIMULANTS"
        when sub2_d = 13 then "BENZODIAZEPINES"
        when sub2_d = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub2_d = 15 then "BARBITURATES"
        when sub2_d = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub2_d = 17 then "INHALANTS"
        when sub2_d = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub2_d = 19 then "OTHER"
    else "Undefined"
    end sub2_d_de
  ,case when sub3_d = 1  then "NONE"
        when sub3_d = 2  then "ALCOHOL"
        when sub3_d = 3  then "COCAINE/CRACK"
        when sub3_d = 4  then "MARIJUANA/HASHISH"
        when sub3_d = 5  then "HEROIN"
        when sub3_d = 6  then "NON-PRESCRIPTION METHADONE"
        when sub3_d = 7  then "OTHER OPIATES AND SYNTHETICS"
        when sub3_d = 8  then "PCP"
        when sub3_d = 9  then "OTHER HALLUCINOGENS"
        when sub3_d = 10 then "METHAMPHETAMINE"
        when sub3_d = 11 then "OTHER AMPHETAMINES"
        when sub3_d = 12 then "OTHER STIMULANTS"
        when sub3_d = 13 then "BENZODIAZEPINES"
        when sub3_d = 14 then "OTHER NON-BENZODIAZEPINE TRANQUILIZERS"
        when sub3_d = 15 then "BARBITURATES"
        when sub3_d = 16 then "OTHER NON-BARBITURATE SEDATIVES OR HYPNOTICS"
        when sub3_d = 17 then "INHALANTS"
        when sub3_d = 18 then "OVER-THE-COUNTER MEDICATIONS"
        when sub3_d = 19 then "OTHER"
    else "Undefined"
    end sub3_d_de  
  ,case when employ_d = 1  then "FULL TIME"
        when employ_d = 2  then "PART TIME"
        when employ_d = 3  then "UNEMPLOYED"
        when employ_d = 4  then "NOT IN LABOR FORCE"
        when employ_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end employ_d_de  
  ,case when livarag_d = 1  then "HOMELESS"
        when livarag_d = 2  then "DEPENDENT LIVING"
        when livarag_d = 3  then "INDEPENDENT LIVING"
        when livarag_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end livarag_d_de
  ,case when detnlf_d = 1  then "HOMEMAKER"
        when detnlf_d = 2  then "STUDENT"
        when detnlf_d = 3  then "RETIRED, DISABLED"
        when detnlf_d = 4  then "RESIDENT OF INSTITUTION"
        when detnlf_d = 5  then "OTHER"
        when detnlf_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end detnlf_d_de
  ,case when freq1_d = 1  then "NO USE IN THE PAST MONTH"
        when freq1_d = 2  then "SOME USE"
        when freq1_d = 3  then "DAILY USE"
        when freq1_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq1_d_de
  ,case when freq2_d = 1  then "NO USE IN THE PAST MONTH"
        when freq2_d = 2  then "SOME USE"
        when freq2_d = 3  then "DAILY USE"
        when freq2_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq2_d_de 
  ,case when freq3_d = 1  then "NO USE IN THE PAST MONTH"
        when freq3_d = 2  then "SOME USE"
        when freq3_d = 3  then "DAILY USE"
        when freq3_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq3_d_de
  ,case when freq_atnd_self_help_d = 1  then "NO ATTENDANCE"
        when freq_atnd_self_help_d = 2  then "1-3 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help_d = 3  then "4-7 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help_d = 4  then "8-30 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help_d = 5  then "SOME ATTENDANCE, FREQUENCY IS UNKNOWN"
        when freq_atnd_self_help_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq_atnd_self_help_d_de
  ,case when los = 1  then "1"
        when los = 2  then "2"
        when los = 3  then "3"
        when los = 4  then "4"
        when los = 5  then "5"
        when los = 6  then "6"
        when los = 7  then "7"
        when los = 8  then "8"
        when los = 9  then "9"
        when los = 10 then "10"
        when los = 11 then "11"
        when los = 12 then "12"
        when los = 13 then "13"
        when los = 14 then "14"
        when los = 15 then "15"
        when los = 16 then "16"
        when los = 17 then "17"
        when los = 18 then "18"
        when los = 19 then "19"
        when los = 20 then "20"
        when los = 21 then "21"
        when los = 22 then "22"
        when los = 23 then "23"
        when los = 24 then "24"
        when los = 25 then "25"
        when los = 26 then "26"
        when los = 27 then "27"
        when los = 28 then "28"
        when los = 29 then "29"
        when los = 30 then "30"
        when los = 31 then "31 TO 45 DAYS"
        when los = 32 then "46 TO 60 DAYS"
        when los = 33 then "61 TO 90 DAYS"
        when los = 34 then "91 TO 120 DAYS"
        when los = 35 then "121 TO 180 DAYS"
        when los = 36 then "181 TO 365 DAYS"
        when los = 37 then "MORE THAN A YEAR"
        when los = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end los_de
  ,case when arrests_d = 0 then "NONE"
        when arrests_d = 1 then "ONCE"
        when arrests_d = 2 then "TWO OR MORE TIMES"
        when arrests_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end arrests_d_de
  ,case when alcflg = 0 then "SUBSTANCE NOT REPORTED"
        when alcflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end alcflg_de
  ,case when cokeflg = 0 then "SUBSTANCE NOT REPORTED"
        when cokeflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end cokeflg_de  
  ,case when marflg = 0 then "SUBSTANCE NOT REPORTED"
        when marflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end marflg_de  
  ,case when herflg = 0 then "SUBSTANCE NOT REPORTED"
        when herflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end herflg_de  
  ,case when methflg = 0 then "SUBSTANCE NOT REPORTED"
        when methflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end methflg_de
  ,case when opsynflg = 0 then "SUBSTANCE NOT REPORTED"
        when opsynflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end opsynflg_de  
  ,case when pcpflg = 0 then "SUBSTANCE NOT REPORTED"
        when pcpflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end pcpflg_de  
  ,case when hallflg = 0 then "SUBSTANCE NOT REPORTED"
        when hallflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end hallflg_de
  ,case when mthamflg = 0 then "SUBSTANCE NOT REPORTED"
        when mthamflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end mthamflg_de  
  ,case when amphflg = 0 then "SUBSTANCE NOT REPORTED"
        when amphflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end amphflg_de  
  ,case when stimflg = 0 then "SUBSTANCE NOT REPORTED"
        when stimflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end stimflg_de  
  ,case when benzflg = 0 then "SUBSTANCE NOT REPORTED"
        when benzflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end benzflg_de
  ,case when trnqflg = 0 then "SUBSTANCE NOT REPORTED"
        when trnqflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end trnqflg_de  
  ,case when barbflg = 0 then "SUBSTANCE NOT REPORTED"
        when barbflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end barbflg_de  
  ,case when sedhpflg = 0 then "SUBSTANCE NOT REPORTED"
        when sedhpflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end sedhpflg_de  
  ,case when inhflg = 0 then "SUBSTANCE NOT REPORTED"
        when inhflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end inhflg_de
  ,case when otcflg = 0 then "SUBSTANCE NOT REPORTED"
        when otcflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end otcflg_de  
  ,case when otherflg = 0 then "SUBSTANCE NOT REPORTED"
        when otherflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end otherflg_de
  ,numsubs
  ,case when idu = 0  then "IDU NOT REPORTED"
        when idu = 1  then "IDU REPORTED"
        when idu = -9 then "NO SUBSTANCES REPORTED"
   else "Undefined"
   end idu_de 
  ,case when division = 0 then "US JURISDICTION/TERRITORY"
        when division = 1 then "NEW ENGLAND"
        when division = 2 then "MID-ATLANTIC"
        when division = 3 then "EAST NORTH CENTRAL"
        when division = 4 then "WEST NORTH CENTRAL"
        when division = 5 then "SOUTH ATLANTIC"
        when division = 6 then "EAST SOUTH CENTRAL"
        when division = 7 then "WEST SOUTH CENTRAL"
        when division = 8 then "MOUNTAIN"
        when division = 9 then "PACIFIC"
   else "Undefined"
   end division_de
  ,case when region = 0 then "US JURISDICTION/TERRITORY"
        when region = 1 then "NORTHEAST"
        when region = 2 then "MIDWEST"
        when region = 3 then "SOUTH"
        when region = 4 then "WEST"
   else "Undefined"
   end region_de
  ,case when alcdrug = 0 then "NONE"
        when alcdrug = 1 then "ALCOHOL ONLY"
        when alcdrug = 2 then "OTHER DRUGS ONLY"
        when alcdrug = 3 then "ALCOHOL AND OTHER DRUGS"
   else "Undefined"
   end alcdrug_de
  ,year_de
  ,cbsa
  ,case when gender = 1  then "MALE"
        when gender = 2  then "FEMALE"
        when gender = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end gender_de 
from discharges_raw;


alter table discharges_raw_recoded add disch_raw_recoded_pk_id int auto_increment primary key first;


-----------------------------------------------------------
-- disch_lookup_final with reduced amount of columns
-----------------------------------------------------------

create table disch_lookup_final as select  
  year_de,
  age_de,
  gender_de,
  route1_de, 
  freq1_de, 
  sub3_d_de,
  primpay_de, 
  psyprob_de, 
  daywait_de, 
  detcrim_de, 
  livarag_de,
  freq_atnd_self_help_de,
  los_de, 
  sub3_de,
  sub1_de, 
  employ_d_de, 
  sub1_d_de, 
  sub2_d_de, 
  region_de, 
  stfips_de, 
  freq_atnd_self_help_d_de,
  division_de, 
  livarag_d_de,
  freq1_d_de,
  services_d_de,
  services_de,
  alcdrug_de, 
  arrests_de, 
  hlthins_de, 
  freq2_de,
  case when reason_de = 'TREATMENT COMPLETED' then 'Complete'
  else 'Incomplete'
  end reason_de
from
  disch_lookups;


alter table disch_lookup_final add disch_raw_final_pk_id int auto_increment primary key first;

