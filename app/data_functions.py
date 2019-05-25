##########################################################################################
#  *This script is to read SQL queries from a dictionary and serve them as smaller dataframes
#  for visualization purposes.
# *Start Date: 05-24-2019
# *Modified On: 05-25-2019
# *Functions:
# 1. serve_data() : Takes no arguments, returns a dictionary of dataframes 
#    for a set of keys defined in the "dbqueries.py".
# 2. getFailedQueryNames() : Takes the output dictionary from serve_data and returns
#    a list of failed queries
#  *The function serve_data can be turned to return one dataframe at a time given the key 
#  from the "dbqueries.py" - Continuing to work on this.
# *Errors & Exceptions:
#  *An 'error_log' file is created whenever exception errors are thrown during query execution.
# *Dependencies:
#   1.config.py - Database connection parameters can be found in here.
#   2.dbqueries.py - SQL queries are listed in a dictionary.
# *Measured Performance (~= approximate time taken with the current functionality)
# *Takes ~= 6 minutes and 12 seconds on my PC (Windows 10 OS, Single core)
##########################################################################################
# Dependencies
import numpy as np
import pandas as pd
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base
from sqlalchemy import create_engine
from config import dbuser, dbpasswd, dburi, dbport, dbname
from dbqueries import db_queries_dict, __CHUNK_SIZE, LOG_FILENAME, __ERROR_TEXT
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
        error_flag = False
        # Execute the query using db connection
        try:
            temp_df = pd.DataFrame()
            # Fetch data in maneageable chunks.
            generator = pd.read_sql_query(value, conn, chunksize = __CHUNK_SIZE)
            for chunk in generator:
                temp_df = pd.concat([temp_df, chunk], ignore_index=True)
        except Exception as error:
            #print(str(error)) # This prints error on the console
            error_flag = True
            logging.error("\nCouldn't process query due to this error: \n" + str(error))
        if (error_flag == False):
            # If key exists in the dictionary, update the value.  Otherwise, add.
            if key in temp_df_dict:
                temp_df_dict[key] = temp_df
            else:
                temp_df_dict.add(key, temp_df)
        else:
            temp_df_dict[key] = __ERROR_TEXT
    conn.close()
    return temp_df_dict

# This function returns all the failed query names from temp_df_dict
def getFailedQueries(aDict):
    temp_failed_query_names = []
    for key,value in aDict.items():
        # If there're no failures recorded in the dictionary, print a success message,
        # and return an empty list. Else, return only the queries which succeeded.
        if not isinstance(value, pd.DataFrame):
            temp_failed_query_names.append(key)
    return temp_failed_query_names

# Testing the functionality of data_functions.py here
if __name__ == '__main__':
    results_dict = serve_data()
    # Test for dataframe dictionary's contents
    #for key in results_dict:
    #    print(results_dict)
    # Test for failed query list
    failed_query_list = getFailedQueries(results_dict)
    print(failed_query_list)
