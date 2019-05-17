mysql -uroot -p -h127.0.0.1 sakila


create database project2;

use project2;


----------------------------------------------------------
-- drug overdose data
----------------------------------------------------------


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
'C:\\Users\\erp_p\\OneDrive\\Documents\\USC\\Projects\\Team Project 2\\Data\\DRUG_DEATHS2016_ADDED_REGION.csv'
INTO TABLE drug_deaths  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
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

----------------------------------------------------------
-- admissions_raw (csv data no manipulation)
----------------------------------------------------------

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


--LOAD RAW ADMISSIONS DATA (ALL)
LOAD DATA LOCAL INFILE  
'C:\\Users\\erp_p\\OneDrive\\Documents\\USC\\Projects\\Team Project 2\\Data\\admissions.csv'
INTO TABLE admissions_raw  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
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

----------------------------------------------------------
-- discharges_raw (csv data no manipulation)
----------------------------------------------------------

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


--LOAD RAW DISCHARGES DATA (ALL)
LOAD DATA LOCAL INFILE  
'C:\\Users\\erp_p\\OneDrive\\Documents\\USC\\Projects\\Team Project 2\\Data\\discharges.csv'
INTO TABLE discharges_raw  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
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


--------------------------------
--table with lookup keys
--------------------------------

--admissions data
create table adm_lookups as select
   caseid 
  ,stfips 
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







--discharges data
create table disch_lookups
as select
   disyr
  ,caseid
  ,stfips
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
  ,detnlf_d
  ,freq1_d
  ,freq2_d
  ,freq3_d
  ,freq_atnd_self_help_d
  ,los
  ,arrests_d
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
  ,division
  ,region
  ,alcdrug
  ,year_de
  ,cbsa
  ,gender
from discharges_raw;


-----------------------------------
--sample lookup table
-----------------------------------

create table age_lookup
(
  value_nr       smallint(5)
 ,age_range_de   varchar(15)
);

insert into age_lookup values (1, '12-14'); 
insert into age_lookup values (2, '15-17'); 
insert into age_lookup values (3, '18-20'); 
insert into age_lookup values (4, '21-24'); 
insert into age_lookup values (5, '25-29'); 
insert into age_lookup values (6, '30-34'); 
insert into age_lookup values (7, '35-39'); 
insert into age_lookup values (8, '40-44'); 
insert into age_lookup values (9, '45-49'); 
insert into age_lookup values (10, '50-54');
insert into age_lookup values (11, '55-64');
insert into age_lookup values (12, '65 and older');

