drop database if exists project2;

create database project2;

use project2;


#----------------------------------------------------------
#-- drug overdose data
#----------------------------------------------------------


create table drug_deaths
(
   drug_deaths_pk_id               int(5) unsigned not null auto_increment
  ,year_de                         varchar(4)
  ,state_de                        varchar(2)
  ,region                          varchar(10)
  ,rate                            decimal(5,2)
  ,deaths                          int(10)
  ,url                             varchar(100)
  ,primary key (drug_deaths_pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


LOAD DATA LOCAL INFILE  
'DRUG_DEATHS2016_ADDED_REGION.csv'
INTO TABLE drug_deaths  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
( 
   year_de                    
  ,state_de         
  ,region           
  ,rate             
  ,deaths           
  ,url              
)
set drug_deaths_pk_id = null;  

select '------------------------------------------------------' from dual;
select concat("Table drug_deaths created. Count is ", count(*) ) from drug_deaths; 

#select count(*) from drug_deaths;
#--count should be 50

#----------------------------------------------------------
#-- admissions_raw (csv data no manipulation)
#----------------------------------------------------------

create table admissions_raw
(
   adm_pk_id                       int(20) unsigned not null auto_increment
  ,caseid                          int(20)
  ,stfips                          smallint(5)
  ,age                             smallint(5)
  ,services                        smallint(5)
  ,sub1                            smallint(5)
  ,sub2                            smallint(5)
  ,sub3                            smallint(5)
  ,detcrim                         smallint(5)
  ,noprior                         smallint(5)
  ,psource                         smallint(5)
  ,arrests                         smallint(5)
  ,race                            smallint(5)
  ,ethnic                          smallint(5)
  ,gender                          smallint(5)
  ,educ                            smallint(5)
  ,employ                          smallint(5)
  ,methuse                         smallint(5)
  ,psyprob                         smallint(5)
  ,preg                            smallint(5)
  ,vet                             smallint(5)
  ,livarag                         smallint(5)
  ,priminc                         smallint(5)
  ,hlthins                         smallint(5)
  ,primpay                         smallint(5)
  ,detnlf                          smallint(5)
  ,marstat                         smallint(5)
  ,daywait                         smallint(5)
  ,route1                          smallint(5)
  ,freq1                           smallint(5)
  ,frstuse1                        smallint(5)
  ,route2                          smallint(5)
  ,freq2                           smallint(5)
  ,frstuse2                        smallint(5)
  ,route3                          smallint(5)
  ,freq3                           smallint(5)
  ,frstuse3                        smallint(5)
  ,freq_atnd_self_help             smallint(5)
  ,dsmcrit                         smallint(5)
  ,alcflg                          smallint(5)
  ,cokeflg                         smallint(5)
  ,marflg                          smallint(5)
  ,herflg                          smallint(5)
  ,methflg                         smallint(5)
  ,opsynflg                        smallint(5)
  ,pcpflg                          smallint(5)
  ,hallflg                         smallint(5)
  ,mthamflg                        smallint(5)
  ,amphflg                         smallint(5)
  ,stimflg                         smallint(5)
  ,benzflg                         smallint(5)
  ,trnqflg                         smallint(5)
  ,barbflg                         smallint(5)
  ,sedhpflg                        smallint(5)
  ,inhflg                          smallint(5)
  ,otcflg                          smallint(5)
  ,otherflg                        smallint(5)
  ,division                        smallint(5)
  ,region                          smallint(5)
  ,alcdrug                         smallint(5)
  ,year_de                         varchar(4)
  ,cbsa10                          smallint(5)
  ,idu                             smallint(5)
  ,primary key (adm_pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


#--LOAD RAW ADMISSIONS DATA (ALL)
LOAD DATA LOCAL INFILE  
'admissions.csv'
INTO TABLE admissions_raw  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(                      
   caseid
  ,stfips
  ,age
  ,services
  ,sub1
  ,sub2
  ,sub3
  ,detcrim
  ,noprior
  ,psource
  ,arrests
  ,race
  ,ethnic
  ,gender
  ,educ
  ,employ
  ,methuse
  ,psyprob
  ,preg
  ,vet
  ,livarag
  ,priminc
  ,hlthins
  ,primpay
  ,detnlf
  ,marstat
  ,daywait
  ,route1
  ,freq1
  ,frstuse1
  ,route2
  ,freq2
  ,frstuse2
  ,route3
  ,freq3
  ,frstuse3
  ,freq_atnd_self_help
  ,dsmcrit
  ,alcflg
  ,cokeflg
  ,marflg
  ,herflg
  ,methflg
  ,opsynflg
  ,pcpflg
  ,hallflg
  ,mthamflg
  ,amphflg
  ,stimflg
  ,benzflg
  ,trnqflg
  ,barbflg
  ,sedhpflg
  ,inhflg
  ,otcflg
  ,otherflg
  ,division
  ,region
  ,alcdrug
  ,year_de
  ,cbsa10
  ,idu
)
set adm_pk_id = null;  

select '------------------------------------------------------' from dual;
select concat("Table admissions_raw created. Count is ", count(*) ) from admissions_raw;

#select count(*) from admissions_raw;
#--should be 1048575

#----------------------------------------------------------
#-- discharges_raw (csv data no manipulation)
#----------------------------------------------------------

create table discharges_raw
(
   disch_pk_id                            int(20) unsigned not null auto_increment
  ,disyr                                  varchar(4)
  ,caseid                                 int(20)
  ,stfips                                 smallint(5)
  ,age                                    smallint(5)
  ,services                               smallint(5)
  ,sub1                                   smallint(5)
  ,sub2                                   smallint(5)
  ,sub3                                   smallint(5)
  ,detcrim                                smallint(5)
  ,noprior                                smallint(5)
  ,psource                                smallint(5)
  ,arrests                                smallint(5)
  ,race                                   smallint(5)
  ,ethnic                                 smallint(5)
  ,educ                                   smallint(5)
  ,employ                                 smallint(5)
  ,methuse                                smallint(5)
  ,psyprob                                smallint(5)
  ,preg                                   smallint(5)
  ,vet                                    smallint(5)
  ,livarag                                smallint(5)
  ,priminc                                smallint(5)
  ,hlthins                                smallint(5)
  ,primpay                                smallint(5)
  ,detnlf                                 smallint(5)
  ,marstat                                smallint(5)
  ,daywait                                smallint(5)
  ,route1                                 smallint(5)
  ,freq1                                  smallint(5)
  ,frstuse1                               smallint(5)
  ,route2                                 smallint(5)
  ,freq2                                  smallint(5)
  ,frstuse2                               smallint(5)
  ,route3                                 smallint(5)
  ,freq3                                  smallint(5)
  ,frstuse3                               smallint(5)
  ,freq_atnd_self_help                    smallint(5)
  ,dsmcrit                                smallint(5)
  ,services_d                             smallint(5)
  ,reason                                 smallint(5)
  ,sub1_d                                 smallint(5)
  ,sub2_d                                 smallint(5)
  ,sub3_d                                 smallint(5)
  ,employ_d                               smallint(5)
  ,livarag_d                              smallint(5)
  ,detnlf_d                               smallint(5)
  ,freq1_d                                smallint(5)
  ,freq2_d                                smallint(5)
  ,freq3_d                                smallint(5)
  ,freq_atnd_self_help_d                  smallint(5)
  ,los                                    smallint(5)
  ,arrests_d                              smallint(5)
  ,alcflg                                 smallint(5)
  ,cokeflg                                smallint(5)
  ,marflg                                 smallint(5)
  ,herflg                                 smallint(5)
  ,methflg                                smallint(5)
  ,opsynflg                               smallint(5)
  ,pcpflg                                 smallint(5)
  ,hallflg                                smallint(5)
  ,mthamflg                               smallint(5)
  ,amphflg                                smallint(5)
  ,stimflg                                smallint(5)
  ,benzflg                                smallint(5)
  ,trnqflg                                smallint(5)
  ,barbflg                                smallint(5)
  ,sedhpflg                               smallint(5)
  ,inhflg                                 smallint(5)
  ,otcflg                                 smallint(5)
  ,otherflg                               smallint(5)
  ,numsubs                                smallint(5)
  ,idu                                    smallint(5)
  ,division                               smallint(5)
  ,region                                 smallint(5)
  ,alcdrug                                smallint(5)
  ,year_de                                varchar(4)
  ,cbsa                                   smallint(5)
  ,gender                                 smallint(5)
  ,primary key (disch_pk_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


#--LOAD RAW DISCHARGES DATA (ALL)
LOAD DATA LOCAL INFILE  
'discharges.csv'
INTO TABLE discharges_raw  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(                      
   disyr
  ,caseid
  ,stfips
  ,age
  ,services
  ,sub1
  ,sub2
  ,sub3
  ,detcrim
  ,noprior
  ,psource
  ,arrests
  ,race
  ,ethnic
  ,educ
  ,employ
  ,methuse
  ,psyprob
  ,preg
  ,vet
  ,livarag
  ,priminc
  ,hlthins
  ,primpay
  ,detnlf
  ,marstat
  ,daywait
  ,route1
  ,freq1
  ,frstuse1
  ,route2
  ,freq2
  ,frstuse2
  ,route3
  ,freq3
  ,frstuse3
  ,freq_atnd_self_help
  ,dsmcrit
  ,services_d
  ,reason
  ,sub1_d
  ,sub2_d
  ,sub3_d
  ,employ_d
  ,livarag_d
  ,detnlf_d
  ,freq1_d
  ,freq2_d
  ,freq3_d
  ,freq_atnd_self_help_d
  ,los
  ,arrests_d
  ,alcflg
  ,cokeflg
  ,marflg
  ,herflg
  ,methflg
  ,opsynflg
  ,pcpflg
  ,hallflg
  ,mthamflg
  ,amphflg
  ,stimflg
  ,benzflg
  ,trnqflg
  ,barbflg
  ,sedhpflg
  ,inhflg
  ,otcflg
  ,otherflg
  ,numsubs
  ,idu
  ,division
  ,region
  ,alcdrug
  ,year_de
  ,cbsa
  ,gender
)
set disch_pk_id = null;  

select '------------------------------------------------------' from dual;
select concat("Table discharges_raw created. Count is ", count(*) ) from discharges_raw;

#select count(*) from discharges_raw;
#--should be 1048757


#--------------------------------
#--table with lookup keys
#--------------------------------

#--admissions data
create table adm_lookups as select
   caseid 
  ,stfips
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
  ,age
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
  ,services
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
  ,sub1
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
  ,sub2
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
  ,sub3
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
  ,detcrim
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
  ,noprior 
  ,case when noprior = 0 then "NO PRIOR TREATMENT EPISODE"
        when noprior = 1 then "ONE AND MORE PRIOR TREATMENT EPISODES"
        when noprior = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end noprior_de
  ,psource 
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
  ,arrests
  ,case when arrests = 0 then "NONE"
        when arrests = 1 then "ONCE"
        when arrests = 2 then "TWO OR MORE TIMES"
        when arrests = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end arrests_de
  ,race
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
  ,ethnic
  ,case when ethnic = 1  then "PUERTO RICAN"
        when ethnic = 2  then "MEXICAN"
        when ethnic = 3  then "CUBAN OR OTHER SPECIFIC HISPANIC"
        when ethnic = 4  then "NOT OF HISPANIC OR LATINO ORIGIN"
        when ethnic = 5  then "HISPANIC OR LATINO, SPECIFIC ORIGIN NOT SPECIFIED"
        when ethnic = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end ethnic_de
  ,gender 
  ,case when gender = 1  then "MALE"
        when gender = 2  then "FEMALE"
        when gender = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end gender_de  
  ,educ 
  ,case when educ = 1  then "8 YEARS OR LESS"
        when educ = 2  then "9-11"
        when educ = 3  then "12 (GED)"
        when educ = 4  then "13-15"
        when educ = 5  then "16 OR MORE"
        when educ = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end educ_de
  ,employ
  ,case when employ = 1  then "FULL TIME"
        when employ = 2  then "PART TIME"
        when employ = 3  then "UNEMPLOYED"
        when employ = 4  then "NOT IN LABOR FORCE"
        when employ = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end employ_de  
  ,methuse
  ,case when methuse =  1 then "YES"
        when methuse =  2 then "NO"
        when methuse = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end methuse_de
  ,psyprob 
  ,case when psyprob =  1 then "YES"
        when psyprob =  2 then "NO"
        when psyprob = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end psyprob_de  
  ,preg 
  ,case when preg =  1 then "YES"
        when preg =  2 then "NO"
        when preg = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end preg_de   
  ,vet
  ,case when vet =  1 then "YES"
        when vet =  2 then "NO"
        when vet = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end vet_de
  ,livarag 
  ,case when livarag = 1  then "HOMELESS"
        when livarag = 2  then "DEPENDENT LIVING"
        when livarag = 3  then "INDEPENDENT LIVING"
        when livarag = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end livarag_de  
  ,priminc 
  ,case when priminc = 1  then "WAGES/SALARY"
        when priminc = 2  then "PUBLIC ASSISTANCE"
        when priminc = 3  then "RETIREMENT/PENSION, DISABILITY"
        when priminc = 4  then "OTHER"
        when priminc = 5  then "NONE"
        when priminc = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end priminc_de  
  ,hlthins 
  
  ,case when hlthins = 1  then "PRIVATE INSURANCE, BLUE CROSS/BLUE SHIELD, HMO"
        when hlthins = 2  then "MEDICAID"
        when hlthins = 3  then "MEDICARE, OTHER (E.G. TRICARE, CHAMPUS)"
        when hlthins = 4  then "NONE"
        when hlthins = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end hlthins_de  
  ,primpay 
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
  ,detnlf 
  ,case when detnlf = 1  then "HOMEMAKER"
        when detnlf = 2  then "STUDENT"
        when detnlf = 3  then "RETIRED, DISABLED"
        when detnlf = 4  then "RESIDENT OF INSTITUTION"
        when detnlf = 5  then "OTHER"
        when detnlf = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end detnlf_de
  ,marstat
  ,case when marstat = 1  then "NEVER MARRIED"
        when marstat = 2  then "NOW MARRIED"
        when marstat = 3  then "SEPARATED"
        when marstat = 4  then "DIVORCED, WIDOWED"
        when marstat = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end marstat_de
  ,daywait 
  ,case when daywait = 0  then "0"
        when daywait = 1  then "1-7"
        when daywait = 2  then "8-14"
        when daywait = 3  then "15-30"
        when daywait = 4  then "31 and more"
        when daywait = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end daywait_de  
  ,route1
  ,case when route1 = 1  then "ORAL"
        when route1 = 2  then "SMOKING"
        when route1 = 3  then "INHALATION"
        when route1 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route1 = 5  then "OTHER"
        when route1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route1_de
  ,freq1
  ,case when freq1 = 1  then "NO USE IN THE PAST MONTH"
        when freq1 = 2  then "SOME USE"
        when freq1 = 3  then "DAILY USE"
        when freq1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq1_de
  ,frstuse1
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
  ,route2
  ,case when route2 = 1  then "ORAL"
        when route2 = 2  then "SMOKING"
        when route2 = 3  then "INHALATION"
        when route2 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route2 = 5  then "OTHER"
        when route2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route2_de
  ,freq2
  ,case when freq2 = 1  then "NO USE IN THE PAST MONTH"
        when freq2 = 2  then "SOME USE"
        when freq2 = 3  then "DAILY USE"
        when freq2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq2_de  
  ,frstuse2
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
  ,route3
  ,case when route3 = 1  then "ORAL"
        when route3 = 2  then "SMOKING"
        when route3 = 3  then "INHALATION"
        when route3 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route3 = 5  then "OTHER"
        when route3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route3_de
  ,freq3
  ,case when freq3 = 1  then "NO USE IN THE PAST MONTH"
        when freq3 = 2  then "SOME USE"
        when freq3 = 3  then "DAILY USE"
        when freq3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq3_de
  ,frstuse3 
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
  ,freq_atnd_self_help
  ,case when freq_atnd_self_help = 1  then "NO ATTENDANCE"
        when freq_atnd_self_help = 2  then "1-3 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 3  then "4-7 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 4  then "8-30 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 5  then "SOME ATTENDANCE, FREQUENCY IS UNKNOWN"
        when freq_atnd_self_help = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq_atnd_self_help_de
  ,dsmcrit
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
  ,alcflg
  ,case when alcflg = 0 then "SUBSTANCE NOT REPORTED"
        when alcflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end alcflg_de
  ,cokeflg
  ,case when cokeflg = 0 then "SUBSTANCE NOT REPORTED"
        when cokeflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end cokeflg_de  
  ,marflg 
  ,case when marflg = 0 then "SUBSTANCE NOT REPORTED"
        when marflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end marflg_de  
  ,herflg 
  ,case when herflg = 0 then "SUBSTANCE NOT REPORTED"
        when herflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end herflg_de  
  ,methflg 
  ,case when methflg = 0 then "SUBSTANCE NOT REPORTED"
        when methflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end methflg_de  
  ,opsynflg
  ,case when opsynflg = 0 then "SUBSTANCE NOT REPORTED"
        when opsynflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end opsynflg_de  
  ,pcpflg
  ,case when pcpflg = 0 then "SUBSTANCE NOT REPORTED"
        when pcpflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end pcpflg_de  
 ,hallflg
  ,case when hallflg = 0 then "SUBSTANCE NOT REPORTED"
        when hallflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end hallflg_de
  ,mthamflg
  ,case when mthamflg = 0 then "SUBSTANCE NOT REPORTED"
        when mthamflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end mthamflg_de  
  ,amphflg 
  ,case when amphflg = 0 then "SUBSTANCE NOT REPORTED"
        when amphflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end amphflg_de  
  ,stimflg
  ,case when stimflg = 0 then "SUBSTANCE NOT REPORTED"
        when stimflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end stimflg_de  
  ,benzflg
  ,case when benzflg = 0 then "SUBSTANCE NOT REPORTED"
        when benzflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end benzflg_de  
  ,trnqflg
  ,case when trnqflg = 0 then "SUBSTANCE NOT REPORTED"
        when trnqflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end trnqflg_de  
  ,barbflg
  ,case when barbflg = 0 then "SUBSTANCE NOT REPORTED"
        when barbflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end barbflg_de  
  ,sedhpflg
  ,case when sedhpflg = 0 then "SUBSTANCE NOT REPORTED"
        when sedhpflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end sedhpflg_de  
  ,inhflg
  ,case when inhflg = 0 then "SUBSTANCE NOT REPORTED"
        when inhflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end inhflg_de  
  ,otcflg
  ,case when otcflg = 0 then "SUBSTANCE NOT REPORTED"
        when otcflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end otcflg_de  
  ,otherflg
  ,case when otherflg = 0 then "SUBSTANCE NOT REPORTED"
        when otherflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end otherflg_de  
  ,division
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
  ,region
  ,case when region = 0 then "US JURISDICTION/TERRITORY"
        when region = 1 then "NORTHEAST"
        when region = 2 then "MIDWEST"
        when region = 3 then "SOUTH"
        when region = 4 then "WEST"
   else "Undefined"
   end region_de
  ,alcdrug 
  ,case when alcdrug = 0 then "NONE"
        when alcdrug = 1 then "ALCOHOL ONLY"
        when alcdrug = 2 then "OTHER DRUGS ONLY"
        when alcdrug = 3 then "ALCOHOL AND OTHER DRUGS"
   else "Undefined"
   end alcdrug_de
  ,year_de
  ,cbsa10 
  ,idu 
  ,case when idu = 0  then "IDU NOT REPORTED"
        when idu = 1  then "IDU REPORTED"
        when idu = -9 then "NO SUBSTANCES REPORTED"
   else "Undefined"
   end idu_de  
FROM 
  admissions_raw;

alter table adm_lookups add adm_lk_pk_id int auto_increment primary key first;


select '------------------------------------------------------' from dual;
select concat("Table adm_lookups created. Count is ", count(*) ) from adm_lookups;

#select count(*) from adm_lookups;


#--discharges data
create table disch_lookups
as select
   disyr
  ,caseid
  ,stfips
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
  ,age
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
  ,services
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
  ,sub1
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
  ,sub2
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
  ,sub3
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
  ,detcrim
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
  ,noprior 
  ,case when noprior = 0 then "NO PRIOR TREATMENT EPISODE"
        when noprior = 1 then "ONE AND MORE PRIOR TREATMENT EPISODES"
        when noprior = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end noprior_de
  ,psource 
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
  ,arrests
  ,case when arrests = 0 then "NONE"
        when arrests = 1 then "ONCE"
        when arrests = 2 then "TWO OR MORE TIMES"
        when arrests = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end arrests_de
  ,race
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
  ,ethnic
  ,case when ethnic = 1  then "PUERTO RICAN"
        when ethnic = 2  then "MEXICAN"
        when ethnic = 3  then "CUBAN OR OTHER SPECIFIC HISPANIC"
        when ethnic = 4  then "NOT OF HISPANIC OR LATINO ORIGIN"
        when ethnic = 5  then "HISPANIC OR LATINO, SPECIFIC ORIGIN NOT SPECIFIED"
        when ethnic = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end ethnic_de
  ,educ 
  ,case when educ = 1  then "8 YEARS OR LESS"
        when educ = 2  then "9-11"
        when educ = 3  then "12 (GED)"
        when educ = 4  then "13-15"
        when educ = 5  then "16 OR MORE"
        when educ = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
        else "Undefined"
        end educ_de
  ,employ
  ,case when employ = 1  then "FULL TIME"
        when employ = 2  then "PART TIME"
        when employ = 3  then "UNEMPLOYED"
        when employ = 4  then "NOT IN LABOR FORCE"
        when employ = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end employ_de  
  ,methuse
  ,case when methuse =  1 then "YES"
        when methuse =  2 then "NO"
        when methuse = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end methuse_de
  ,psyprob 
  ,case when psyprob =  1 then "YES"
        when psyprob =  2 then "NO"
        when psyprob = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end psyprob_de  
  ,preg 
  ,case when preg =  1 then "YES"
        when preg =  2 then "NO"
        when preg = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end preg_de   
  ,vet
  ,case when vet =  1 then "YES"
        when vet =  2 then "NO"
        when vet = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"   
   else "Undefined"
   end vet_de
  ,livarag 
  ,case when livarag = 1  then "HOMELESS"
        when livarag = 2  then "DEPENDENT LIVING"
        when livarag = 3  then "INDEPENDENT LIVING"
        when livarag = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end livarag_de
  ,priminc 
  ,case when priminc = 1  then "WAGES/SALARY"
        when priminc = 2  then "PUBLIC ASSISTANCE"
        when priminc = 3  then "RETIREMENT/PENSION, DISABILITY"
        when priminc = 4  then "OTHER"
        when priminc = 5  then "NONE"
        when priminc = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end priminc_de  
  ,hlthins 
  ,case when hlthins = 1  then "PRIVATE INSURANCE, BLUE CROSS/BLUE SHIELD, HMO"
        when hlthins = 2  then "MEDICAID"
        when hlthins = 3  then "MEDICARE, OTHER (E.G. TRICARE, CHAMPUS)"
        when hlthins = 4  then "NONE"
        when hlthins = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end hlthins_de  
  ,primpay 
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
  ,detnlf 
  ,case when detnlf = 1  then "HOMEMAKER"
        when detnlf = 2  then "STUDENT"
        when detnlf = 3  then "RETIRED, DISABLED"
        when detnlf = 4  then "RESIDENT OF INSTITUTION"
        when detnlf = 5  then "OTHER"
        when detnlf = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end detnlf_de
  ,marstat
  ,case when marstat = 1  then "NEVER MARRIED"
        when marstat = 2  then "NOW MARRIED"
        when marstat = 3  then "SEPARATED"
        when marstat = 4  then "DIVORCED, WIDOWED"
        when marstat = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end marstat_de
  ,daywait 
  ,case when daywait = 0  then "0"
        when daywait = 1  then "1-7"
        when daywait = 2  then "8-14"
        when daywait = 3  then "15-30"
        when daywait = 4  then "31 and more"
        when daywait = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end daywait_de
  ,route1
  ,case when route1 = 1  then "ORAL"
        when route1 = 2  then "SMOKING"
        when route1 = 3  then "INHALATION"
        when route1 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route1 = 5  then "OTHER"
        when route1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route1_de
  ,freq1
  ,case when freq1 = 1  then "NO USE IN THE PAST MONTH"
        when freq1 = 2  then "SOME USE"
        when freq1 = 3  then "DAILY USE"
        when freq1 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq1_de
  ,frstuse1
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
  ,route2
  ,case when route2 = 1  then "ORAL"
        when route2 = 2  then "SMOKING"
        when route2 = 3  then "INHALATION"
        when route2 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route2 = 5  then "OTHER"
        when route2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route2_de
  ,freq2
  ,case when freq2 = 1  then "NO USE IN THE PAST MONTH"
        when freq2 = 2  then "SOME USE"
        when freq2 = 3  then "DAILY USE"
        when freq2 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq2_de  
  ,frstuse2
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
  ,route3
  ,case when route3 = 1  then "ORAL"
        when route3 = 2  then "SMOKING"
        when route3 = 3  then "INHALATION"
        when route3 = 4  then "INJECTION (IV OR INTRAMUSCULAR)"
        when route3 = 5  then "OTHER"
        when route3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end route3_de
  ,freq3
  ,case when freq3 = 1  then "NO USE IN THE PAST MONTH"
        when freq3 = 2  then "SOME USE"
        when freq3 = 3  then "DAILY USE"
        when freq3 = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq3_de
  ,frstuse3 
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
  ,freq_atnd_self_help
  ,case when freq_atnd_self_help = 1  then "NO ATTENDANCE"
        when freq_atnd_self_help = 2  then "1-3 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 3  then "4-7 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 4  then "8-30 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help = 5  then "SOME ATTENDANCE, FREQUENCY IS UNKNOWN"
        when freq_atnd_self_help = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq_atnd_self_help_de
  ,dsmcrit
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
  ,services_d
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
  ,reason
  ,case when reason = 1 then "TREATMENT COMPLETED"
        when reason = 2 then "DROPPED OUT OF TREATMENT"
        when reason = 3 then "TERMINATED BY FACILITY"
        when reason = 4 then "TRANSFERRED TO ANOTHER TREATMENT PROGRAM OR FACILITY"
        when reason = 5 then "INCARCERATED"
        when reason = 6 then "DEATH"
        when reason = 7 then "OTHER"
   else "Undefined"
   end reason_de
  ,sub1_d
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
  ,sub2_d
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
  ,sub3_d
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
  ,employ_d
  ,case when employ_d = 1  then "FULL TIME"
        when employ_d = 2  then "PART TIME"
        when employ_d = 3  then "UNEMPLOYED"
        when employ_d = 4  then "NOT IN LABOR FORCE"
        when employ_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end employ_d_de  
  ,livarag_d
  ,case when livarag_d = 1  then "HOMELESS"
        when livarag_d = 2  then "DEPENDENT LIVING"
        when livarag_d = 3  then "INDEPENDENT LIVING"
        when livarag_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end livarag_d_de
  ,detnlf_d
  ,case when detnlf_d = 1  then "HOMEMAKER"
        when detnlf_d = 2  then "STUDENT"
        when detnlf_d = 3  then "RETIRED, DISABLED"
        when detnlf_d = 4  then "RESIDENT OF INSTITUTION"
        when detnlf_d = 5  then "OTHER"
        when detnlf_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end detnlf_d_de
  ,freq1_d
  ,case when freq1_d = 1  then "NO USE IN THE PAST MONTH"
        when freq1_d = 2  then "SOME USE"
        when freq1_d = 3  then "DAILY USE"
        when freq1_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq1_d_de
  ,freq2_d
  ,case when freq2_d = 1  then "NO USE IN THE PAST MONTH"
        when freq2_d = 2  then "SOME USE"
        when freq2_d = 3  then "DAILY USE"
        when freq2_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq2_d_de 
  ,freq3_d
  ,case when freq3_d = 1  then "NO USE IN THE PAST MONTH"
        when freq3_d = 2  then "SOME USE"
        when freq3_d = 3  then "DAILY USE"
        when freq3_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq3_d_de
  ,freq_atnd_self_help_d
  ,case when freq_atnd_self_help_d = 1  then "NO ATTENDANCE"
        when freq_atnd_self_help_d = 2  then "1-3 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help_d = 3  then "4-7 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help_d = 4  then "8-30 TIMES IN THE PAST MONTH"
        when freq_atnd_self_help_d = 5  then "SOME ATTENDANCE, FREQUENCY IS UNKNOWN"
        when freq_atnd_self_help_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end freq_atnd_self_help_d_de
  ,los
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
  ,arrests_d
  ,case when arrests_d = 0 then "NONE"
        when arrests_d = 1 then "ONCE"
        when arrests_d = 2 then "TWO OR MORE TIMES"
        when arrests_d = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end arrests_d_de
  ,alcflg
  ,case when alcflg = 0 then "SUBSTANCE NOT REPORTED"
        when alcflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end alcflg_de
  ,cokeflg
  ,case when cokeflg = 0 then "SUBSTANCE NOT REPORTED"
        when cokeflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end cokeflg_de  
  ,marflg 
  ,case when marflg = 0 then "SUBSTANCE NOT REPORTED"
        when marflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end marflg_de  
  ,herflg 
  ,case when herflg = 0 then "SUBSTANCE NOT REPORTED"
        when herflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end herflg_de  
  ,methflg 
  ,case when methflg = 0 then "SUBSTANCE NOT REPORTED"
        when methflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end methflg_de
  ,opsynflg
  ,case when opsynflg = 0 then "SUBSTANCE NOT REPORTED"
        when opsynflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end opsynflg_de  
  ,pcpflg
  ,case when pcpflg = 0 then "SUBSTANCE NOT REPORTED"
        when pcpflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end pcpflg_de  
 ,hallflg
  ,case when hallflg = 0 then "SUBSTANCE NOT REPORTED"
        when hallflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end hallflg_de
  ,mthamflg
  ,case when mthamflg = 0 then "SUBSTANCE NOT REPORTED"
        when mthamflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end mthamflg_de  
  ,amphflg 
  ,case when amphflg = 0 then "SUBSTANCE NOT REPORTED"
        when amphflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end amphflg_de  
  ,stimflg
  ,case when stimflg = 0 then "SUBSTANCE NOT REPORTED"
        when stimflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end stimflg_de  
  ,benzflg
  ,case when benzflg = 0 then "SUBSTANCE NOT REPORTED"
        when benzflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end benzflg_de
  ,trnqflg
  ,case when trnqflg = 0 then "SUBSTANCE NOT REPORTED"
        when trnqflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end trnqflg_de  
  ,barbflg
  ,case when barbflg = 0 then "SUBSTANCE NOT REPORTED"
        when barbflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end barbflg_de  
  ,sedhpflg
  ,case when sedhpflg = 0 then "SUBSTANCE NOT REPORTED"
        when sedhpflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end sedhpflg_de  
  ,inhflg
  ,case when inhflg = 0 then "SUBSTANCE NOT REPORTED"
        when inhflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end inhflg_de
  ,otcflg
  ,case when otcflg = 0 then "SUBSTANCE NOT REPORTED"
        when otcflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end otcflg_de  
  ,otherflg
  ,case when otherflg = 0 then "SUBSTANCE NOT REPORTED"
        when otherflg = 1 then "SUBSTANCE REPORTED"
   else "Undefined"
   end otherflg_de
  ,numsubs
  ,idu
  ,case when idu = 0  then "IDU NOT REPORTED"
        when idu = 1  then "IDU REPORTED"
        when idu = -9 then "NO SUBSTANCES REPORTED"
   else "Undefined"
   end idu_de 
  ,division
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
  ,region
  ,case when region = 0 then "US JURISDICTION/TERRITORY"
        when region = 1 then "NORTHEAST"
        when region = 2 then "MIDWEST"
        when region = 3 then "SOUTH"
        when region = 4 then "WEST"
   else "Undefined"
   end region_de
  ,alcdrug
  ,case when alcdrug = 0 then "NONE"
        when alcdrug = 1 then "ALCOHOL ONLY"
        when alcdrug = 2 then "OTHER DRUGS ONLY"
        when alcdrug = 3 then "ALCOHOL AND OTHER DRUGS"
   else "Undefined"
   end alcdrug_de
  ,year_de
  ,cbsa
  ,gender
  ,case when gender = 1  then "MALE"
        when gender = 2  then "FEMALE"
        when gender = -9 then "MISSING/UNKNOWN/NOT COLLECTED/INVALID"
   else "Undefined"
   end gender_de 
from discharges_raw;

alter table disch_lookups add disch_lk_pk_id int auto_increment primary key first;


select '------------------------------------------------------' from dual;
select concat("Table disch_lookups created. Count is ", count(*) ) from disch_lookups;

#select count(*) from disch_lookups;


#-----------------------------------------
#--admissions_raw_recoded
#-----------------------------------------

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

select '------------------------------------------------------' from dual;
select concat("Table admissions_raw_recoded created. Count is ", count(*) ) from admissions_raw_recoded;


#-------------------------------------------
##-- discharges_raw_recoded
#-------------------------------------------

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

select '------------------------------------------------------' from dual;
select concat("Table discharges_raw_recoded created. Count is ", count(*) ) from discharges_raw_recoded;

#-----------------------------------------------------------
#-- disch_lookup_final with reduced amount of columns
#-----------------------------------------------------------

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

select '------------------------------------------------------' from dual;
select concat("Table disch_lookup_final created. Count is ", count(*) ) from disch_lookup_final;


#---------------------------------------------------
#-- drug death table modification
#---------------------------------------------------

alter table drug_deaths add column state_full_name_de varchar(25);

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

ALTER TABLE drug_deaths CONVERT TO CHARACTER SET cp850 COLLATE 'cp850_general_ci';  

#----------------------------------------
#-- map visualization table
#----------------------------------------

drop table map_viz;

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
  
alter table map_viz add map_viz_pk_id int auto_increment primary key first;  

select '------------------------------------------------------' from dual;
select concat("Table map_viz created. Count is ", count(*) ) from map_viz;

select '**** SCRIPT COMPLETED SUCCESSFULLY ****' FROM DUAL;
