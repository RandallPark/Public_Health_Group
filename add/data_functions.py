# Dependencies
import numpy as np
import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy import Column, Integer, String, Float
from sqlalchemy.orm import Session

import pymysql
pymysql.install_as_MySQLdb()

# Reflect an existing database into a new model
Base = automap_base()

# Create engine
engine = create_engine("mysql+pymysql://root:root@127.0.0.1:3306/project2")

# reflect the tables
Base.prepare(engine, reflect=True)

# Get connection
conn = engine.connect()

# Create a Session object to connect to the database
session = Session(bind=engine)

# Save reference to the table
drug_deaths = Base.classes.drug_deaths

# Define query string(s) here
query = "SELECT * FROM drug_deaths LIMIT 5"

# Query sample data from the database using the connection object
#sample_data = pd.read_sql(query, conn)
drug_deaths_list = session.query(DrugDeaths)

# Show data
for aDrugDeath in drug_deaths_list:
    print(aDrugDeath.drug_deaths_pk_id)
    print(aDrugDeath.year_de)
    print(aDrugDeath.state_de)
    print(aDrugDeath.region)
    print(aDrugDeath.rate)
    print(aDrugDeath.deaths)
    print(aDrugDeath.url)
#print(sample_data.head())