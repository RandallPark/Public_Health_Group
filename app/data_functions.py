##########################################################################################
#  *This script is to read SQL queries from a dictionary and serve them as smaller dataframes
#  for visualization purposes.
#  *The serve_data() function takes no arguments and returns a dictionary of dataframes 
#  for the same set of keys defined in the "dbqueries.py".
#  *The function serve_data can be turned to return one dataframe at a time given the key 
#  from the "dbqueries.py" - Continuing to work on this.(05-24-2019)
#  *It creates a 'error_log' file on exception error is thrown.
#  *This script refers to the following two files for constants: 
#   1.config.py - Database connection parameters can be found in here.
#   2.dbqueries.py - SQL queries are listed in a dictionary.
##########################################################################################
# Dependencies
import numpy as np
import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy import create_engine
from config import dbuser, dbpasswd, dburi, dbport, dbname
from dbqueries import db_queries_dict, __CHUNK_SIZE, LOG_FILENAME
import copy
import pymysql
pymysql.install_as_MySQLdb()
import logging

# Configure exception logging
logging.basicConfig(filename=LOG_FILENAME, level=logging.DEBUG)

# Created a custom dictionary with add function in it.
class temp_dict(dict):
    # __init__ function 
    def __init__(self): 
        self = dict() 
          
    # Function to add key:value 
    def add(self, key, value): 
        self[key] = value 
temp_df_dict = temp_dict()
# Create engine
engine = create_engine("mysql+pymysql://root:root@127.0.0.1:3306/project2")
#engine = create_engine("mysql+pymysql://{dbuser}:{dbpasswd}@{dburi}:{dbport}/{dbname}") # Throws ValueError for {dbport} type casting didn't work

# Get connection
conn = engine.connect()

def serve_data():
    # Loop through the queries from db_queries_dict imported from dbqueries.py
    for key, value in db_queries_dict.items():
        # Execute the query using db connection
        try:
            temp_df = pd.DataFrame()
            # Fetch data in maneageable chunks.
            generator = pd.read_sql_query(value, conn, chunksize = __CHUNK_SIZE)
            for chunk in generator:
                temp_df = pd.concat([temp_df, chunk], ignore_index=True)
        except Exception as error:
            #print(str(error)) # This prints the error on the console
            logging.error(str(error))
        if key in temp_df_dict:
            temp_df_dict.update(key, temp_df)
        else:
            temp_df_dict.add(key, temp_df)
    conn.close()
    return temp_df_dict

# Test
results_dict = serve_data()
for key, value in results_dict.items():
    print(results_dict)