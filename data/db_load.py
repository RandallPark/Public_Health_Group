import pandas as pd
from sqlalchemy import create_engine
from os import system
from config import dbuser, dbpasswd, dbhost, dbport, dbname 


#-----------------------------------------------
#drug_deaths load
#-----------------------------------------------
# read CSV file
dd_column_names = ['year_de','state_de', 'region', 'rate','deaths','url']

drug_deaths_df = pd.read_csv('DRUG_DEATHS2016_ADDED_REGION.csv', header = 0, names = dd_column_names)
print(drug_deaths_df)

engine = create_engine('mysql://root:root@localhost')
engine.execute("drop DATABASE if exists project2")
engine.execute("CREATE DATABASE project2") 
engine.execute("USE project2") 

with engine.connect() as conn, conn.begin():
    drug_deaths_df.to_sql('drug_deaths', conn, if_exists='replace', index=True)

print('Table DRUG_DEATHS loaded. Now loading table ADMISSIONS_RAW.')

#-----------------------------------------------
#admissions.csv load
#-----------------------------------------------
# read CSV file
adm_column_names = \
[ 'caseid' 
,'stfips' 
,'age' 
,'services' 
,'sub1' 
,'sub2' 
,'sub3' 
,'detcrim' 
,'noprior' 
,'psource' 
,'arrests' 
,'race' 
,'ethnic' 
,'gender' 
,'educ' 
,'employ' 
,'methuse' 
,'psyprob' 
,'preg' 
,'vet' 
,'livarag' 
,'priminc' 
,'hlthins' 
,'primpay' 
,'detnlf' 
,'marstat' 
,'daywait' 
,'route1' 
,'freq1' 
,'frstuse1' 
,'route2' 
,'freq2' 
,'frstuse2' 
,'route3' 
,'freq3' 
,'frstuse3' 
,'freq_atnd_self_help' 
,'dsmcrit' 
,'alcflg' 
,'cokeflg' 
,'marflg' 
,'herflg' 
,'methflg' 
,'opsynflg' 
,'pcpflg' 
,'hallflg' 
,'mthamflg' 
,'amphflg' 
,'stimflg' 
,'benzflg' 
,'trnqflg' 
,'barbflg' 
,'sedhpflg'
,'inhflg' 
,'otcflg' 
,'otherflg'
,'division'
,'region'
,'alcdrug'
,'year_de'
,'cbsa10'
,'idu']

adm_df = pd.read_csv('admissions.csv', header = 0, names = adm_column_names)
adm_df.tail()

engine.execute("USE project2") 

with engine.connect() as conn, conn.begin():
    adm_df.to_sql('admissions_raw', conn, if_exists='replace', index=True)

print('Table ADMISSIONS_RAW load completed.  Now loading table DISCHARGES_RAW.')

#-----------------------------------------------
#discharges.csv load
#-----------------------------------------------
# read CSV file

disch_column_names = \
[ 
 'disyr'
,'caseid'
,'stfips'
,'age'
,'services'
,'sub1'
,'sub2'
,'sub3'
,'detcrim'
,'noprior'
,'psource'
,'arrests'
,'race'
,'ethnic'
,'educ'
,'employ'
,'methuse'
,'psyprob'
,'preg'
,'vet'
,'livarag'
,'priminc'
,'hlthins'
,'primpay'
,'detnlf'
,'marstat'
,'daywait'
,'route1'
,'freq1'
,'frstuse1'
,'route2'
,'freq2'
,'frstuse2'
,'route3'
,'freq3'
,'frstuse3'
,'freq_atnd_self_help'
,'dsmcrit'
,'services_d'
,'reason'
,'sub1_d'
,'sub2_d'
,'sub3_d'
,'employ_d'
,'livarag_d'
,'detnlf_d'
,'freq1_d'
,'freq2_d'
,'freq3_d'
,'freq_atnd_self_help_d'
,'los'
,'arrests_d'
,'alcflg'
,'cokeflg'
,'marflg'
,'herflg'
,'methflg'
,'opsynflg'
,'pcpflg'
,'hallflg'
,'mthamflg'
,'amphflg'
,'stimflg'
,'benzflg'
,'trnqflg'
,'barbflg'
,'sedhpflg'
,'inhflg'
,'otcflg'
,'otherflg'
,'numsubs'
,'idu'
,'division'
,'region'
,'alcdrug'
,'year_de'
,'cbsa'
,'gender'    
]

disch_df = pd.read_csv('discharges.csv', header = 0, names = disch_column_names)
disch_df.tail()

engine.execute("USE project2") 

with engine.connect() as conn, conn.begin():
    disch_df.to_sql('discharges_raw', conn, if_exists='replace', index=True)

print('Table DISCHARGES_RAW completed.  All tables loaded.')

#-------------------------------------------------------------
# create lookup tables
#-------------------------------------------------------------

FILE =  "db_python.sql"
command = """mysql -u %s -p"%s" --host %s --port %s %s < %s --silent --force -b 2> nul""" %(dbuser, dbpasswd, dbhost, dbport, dbname, FILE)
system(command)

print('==============================================')
print('*** PYTHON LOOKUP TABLE SCRIPT COMPLETED ***')

