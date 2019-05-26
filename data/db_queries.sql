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







-----------------------------------------------
--drug deaths by state 
-----------------------------------------------

select
  state_de,
  deaths
from
  drug_deaths;
  

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
create table mf_counts select
  year_de
  sum( case when gender = 1 then 1 else 0 end ) male_count,
  sum( case when gender = 2 then 1 else 0 end ) female_count
from
  adm_lookups
  where year_de = '2016';

--graph this, pct of male vs. female addicts 2016
select
  round(((male_count /(male_count + female_count)) * 100), 2) 'male_addicts_pct',
  round(((female_count /(male_count + female_count)) * 100), 2) 'female_addicts_pct'
from
  mf_counts
where
  year_de = '2016';



-----------------------------------------------
--veteran status as a pct of all admits for year
-----------------------------------------------

create table vet_status as
select
year_de,
sum(case when vet_de = 'YES' then 1 else 0 end) 'VETERAN',
sum(case when vet_de = 'NO' then 1 else 0 end) 'NON_VETERAN'
FROM
ADM_LOOKUPS
where year_de = '2016';

--graph this, pct of vet vs. non-vet addicts 2016
select
  year_de,
  round(((VETERAN /(VETERAN + NON_VETERAN)) * 100), 2) 'VETERAN_PCT',
  round(((NON_VETERAN /(VETERAN + NON_VETERAN)) * 100), 2) 'NON_VETERAN_PCT'
from
  vet_status
where
  year_de = '2016';

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

create table tx_completed
as 
select
 frstuse1_de 'age_started',
 count(reason_de) 'treatment_completed'
from
  disch_lookups
where
  reason_de = 'TREATMENT COMPLETED'
group by
  frstuse1_de;


create table tx_incomplete
as 
select
 frstuse1_de 'age_started',
 count(reason_de) 'treatment_incomplete'
from
  disch_lookups
where
  reason_de != 'TREATMENT COMPLETED'
group by
  frstuse1_de;

select
  a.age_started,
  sum(a.treatment_completed) treatment_completed,
  sum(b.treatment_incomplete) treatment_incomplete
from
  tx_completed a,
  tx_incomplete b
where
  a.age_started = b.age_started
group by
  a.age_started;
  






