### Data Requested @Jamuna
Tasks:
1. number of patients per state
2. number of treatment centers per state
3. Top three primary drugs per state


#### Trends to look at:
Use a GLM (generalized linear model) to determine the variable in the data set that have the largest statistical significance for determining treatment success. 

### Analysis Questions

#### 1.What types of treatment are available in a specific micro or macro area or state (choose one)?:

 Look for the answer in the column:
SERVICES_D: SERVICE SETTING AT DISCHARGE
CBSA: FIPS 2010 CBSACODE (micro area(10 000 population), macro area (up to 50000 population), 
STFIPS: CENSUS STATE FIPSCODE

• “Detox in Hospital ”DETOXIFICATION, 24-HOUR SERVICE, HOSPITAL INPATIENT:
24 hour per day medical acute care services in hospital setting for detoxification of persons with severe medical
complications associated with withdrawal.
• “Detox in rehab” DETOXIFICATION, 24-HOUR , FREE-STANDING RESIDENTIAL:
24 hour per day services in non-hospital setting providing for safe withdrawal and transition to ongoing treatment, medical staff is usually partially present in the detox house or on call.
• “Hospital” REHABILITATION/RESIDENTIAL - HOSPITAL (OTHER THAN DETOX):
24 hour per day medical care in a hospital facility in conjunction with treatment services for alcohol and other drug use
and dependency.
• “RTC” REHAB RESIDENTIAL - SHORT TERM (30 DAYS OR FEWER):
Typically, 30 days or less of non-acute care in a setting with treatment services for alcohol and other drug use and
dependency.
• “PHP “REHAB/RESIDENTIAL - LONG TERM (MORE THAN 30 DAYS):
Typically, more than 30 days of non-acute care in a setting with treatment services for alcohol and other drug use and dependency; this may include transitional living arrangements such as halfway houses.
• “IOP” INTENSIVE OUTPATIENT :
As a minimum, the client receives treatment lasting two or more hours per day for three or more days per week.
• “Outpatient therapy treatment” therapy and/or medications:
• “Detox at home , on your own with prescribed meds– outpatient” AMBULATORY - DETOXIFICATION:
Outpatient treatment services providing for safe withdrawal in an ambulatory setting (pharmacological or
non-pharmacological


#### 2.What types of treatment are the least and the most effective, and where?
Look at the following columns:
SERVICES_D: SERVICE SETTING AT DISCHARGE
Location
REASON: REASON FOR DISCHARGE

#### 3.Where are located the least effective treatments?
Look at:
LOS: LENGTH OF STAY
Location
REASON: REASON FOR DISCHARGE




#### 4.Does the length of stay correlates with outcome of the treatment?
LOS: LENGTH OF STAY

#### 5. Does age correlates with the outcome of the treatment?
REASON: REASON FOR DISCHARGE


#### 6. Does primary drug of choice correlates with AGE?


#### 7. Does length of treatment correlates with the form of payment for the treatment?	
LOS: LENGTH OF STAY
HLTHINS: HEALTH INSURANCE 
or 
PRIMPAY: EXPECTED/ACTUAL PRIMARY SOURCE OF PAYMENT  (This field identifies the primary source of payment for this treatment episode anticipated at the time of admission. Guidelines: States operating under a split payment fee arrangement between multiple payment sources are to default to the payment source with the largest percentage. When payment percentages are equal, the state can select either source. )


#### 8. Does referral source correlates with outcome of the treatment?
REASON: REASON FOR DISCHARGE
PSOURCE: REFERRAL SOURCE

#### 9. Is there a correlation between referral source and gender?


#### 10. Does previous substance use treatment correlates with the primary drug of choice?
NOPRIOR: PREVIOUS SUBSTANCE USE TREATMENT EPISODES

#### 12. Does primary drug of choice correlates with the number of previous treatments?
Use SUB1: SUBSTANCE USE AT ADMISSION (PRIMARY)

#### 13. Is there a correlation between the gender or age and form of administration?
ROUTE1: USUAL ROUTE OF ADMINISTRATION (PRIMARY)

#### 14. Is there a correlation between the gender and diagnosis?
DSMCRIT: DSM DIAGNOSIS

#### 15. Is there correlation between the drug of choice or diagnosis and ducation?
EDUC: EDUCATION 


#### 16. Is there a correlation between the age at first use and source of income or education?
FRSTUSE1: AGE AT FIRST USE (PRIMARY)
PRIMINC: SOURCE OF INCOME/SUPPORT
EMPLOY: EMPLOYMENT STATUS AT ADMISSION



#### 17. Is there a correlation between the living situation and age at first use?
LIVARAG_D: LIVING ARRANGEMENTS AT DISCHARGE
FRSTUSE1: AGE AT FIRST USE (PRIMARY)

#### 18. Is there a correlation between the living situation and diagnosis?
DSMCRIT: DSM DIAGNOSIS
LIVARAG: LIVING ARRANGEMENTS AT ADMISSION

#### 19. Is there a correlation between the first and secondary drug of choice? 
(are they both uppers or both downers)



#### 20. Is there a correlation between  mental health diagnosis (that includes addiction) and reason for discharge?

NOPRIOR: PREVIOUS SUBSTANCE USE TREATMENT EPISODES
DSMCRIT: DSM DIAGNOSIS


#### 21. Is there a correlation between mental health(that includes addiction) diagnosis and criminal charges?
DETCRIM: DETAILED CRIMINAL JUSTICE REFERRAL
DSMCRIT: DSM DIAGNOSIS






