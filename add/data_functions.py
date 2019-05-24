# Dependencies
import numpy as np
import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy import Column, Integer, String, Float
from sqlalchemy import create_engine, func, inspect, desc
from sqlalchemy.orm import Session

import pymysql
pymysql.install_as_MySQLdb()

# Reflect an existing database into a new model
Base = automap_base()

# Create engine
engine = create_engine("mysql+pymysql://root:root@127.0.0.1:3306/project2")

# reflect the tables
Base.prepare(engine, reflect=True)

# We can view all of the classes that automap found
Base.classes.keys()

# Get connection
conn = engine.connect()

# Create a Session object to connect to the database
session = Session(bind=engine)

# Save reference to the table
Admissions = Base.classes.admissions_raw
AdmLookups = Base.classes.adm_lookups

# Define query string(s) here
query = "SELECT adlk.sub1_de, COUNT(adm.sub1)\
         FROM admissions_raw as adm, adm_lookups as adlk\
         WHERE adm.caseid = adlk.caseid;"

# Query sample data from the database using the connection object
results = pd.read_sql(query, conn)
#drug_deaths_results = session.query(query)

# Show data
print(results.head())
# A function to return SQL query results in python object
def fetch_drugs_count():
    top_n_results = session.query(Admissions.sub1, func.count(Admissions.sub1)).group_by(Admissions.sub1).\
        filter(Admissions.caseid == AdmLookups.caseid).all()
    # Construct a dictionary from results using alcdrug as key
    for row in top_n_results:
        topN_alcdrugs_dict = {}
        topN_alcdrugs_dict['sub1'] = row.sub1
        topN_alcdrugs_dict['count'] = row.count
    return topN_alcdrugs_dict

def top_n_drugs(n):
    top_n_prdrugs = fetch_drugs_count()
    top_n_prdrugs_df = pd.DataFrame(top_n_prdrugs)
    return top_n_prdrugs_df.nlargest(n)
    
#print (top_n_drugs(5))