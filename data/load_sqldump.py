#-----------------------------------------------------------------------
# Python script to load data into the database from a compressed (zipped)
# data file to MySqlDB.
# This script requires the compressed '.sql' files (.zip file) to be
# in <Your project folder>/data/dumps.zip for a successful execution.
# Steps to run this load_sqldump.py is:
# 1. Set your current working directory to '<Your project folder>/data'.
# 2. Type 'python load_sqldump.py'
# 3. Wait until the script completes its job. It takes good 20 minutes to load.
#---------------------------------------------------------------------------
# Dependencies
from zipfile import ZipFile
import os
import os.path
from os import system
import time
from datetime import timedelta
from config import dbuser, dbpasswd, dburi, dbport, dbname 
import pymysql
import sqlalchemy
from sqlalchemy import create_engine
from sqlalchemy.ext.automap import automap_base


# A utility function to format time
input_time = time.time()
def getFormattedTime(input_time):
    hours = input_time//3600
    temp = input_time - 3600*hours
    minutes = input_time//60
    seconds = input_time - 60*minutes
    formatted_time = str('%d:%d:%d' %(hours,minutes,seconds))
    return formatted_time

# Keep track of start time, end time and elapsed time
start_time = time.time()
# If '..data/dumps' folder exists, remove it.
cwdir = os.getcwd()
print("\nThis script requires the \'dumps.zip' to be in the \data\ folder of your project directory.\n")
print("Current Working directory is : " + cwdir + "\n")
print("Script is starting at time: " + getFormattedTime(start_time) + "\n")
path_to_extracted_files = cwdir + "/dumps/"
if (os.path.isfile(path_to_extracted_files) == False):
    # Programatically unzip the files into a folder
    path_to_zip_file = cwdir + "/dumps.zip"
    zip_ref = ZipFile(path_to_zip_file, 'r')
    zip_ref.extractall(cwdir)
    zip_ref.close()
    print("Files have been extracted to :" + path_to_extracted_files + "\n")
else:
    print("Directory exists. Skipping unzipping process.")

# Count the total number of files in this directory
total_files_in_dir = len(os.listdir(path_to_extracted_files))

# Get current working directioy
print("There are %d files in the %s folder" %(total_files_in_dir, path_to_extracted_files) + "\n")

# We are to use the os.system to execute our mysql loads. Hence, a check
# for the existence of the database is necessary.  If exists, a deletion followed by creation
# will ensure a fresh load.

# Create engine
engine = create_engine("mysql+pymysql://root:root@127.0.0.1:3306")

# Get connection
conn = engine.connect()

conn.execute("DROP DATABASE if exists project2;")
conn.execute("CREATE DATABASE project2;")
conn.execute("USE project2;") 

# Loop through the dump directory
print(f"Loading begins...\n")
print(f"------------------------------\n")
if (os.path.exists(path_to_extracted_files)):
    # Loop through the files one at a time
    for file in os.listdir(path_to_extracted_files):
        # Get the current file name
        cur_filename = os.path.basename(file)
        # Get file's fullpath
        relpath = os.path.join("/dumps/", file)
        # Construct a mysqldump command string
        # mysql -uroot -p -Dproject2 < ./dumps/project2_admissions_raw.sql <--THIS WORKS from COMMAND PROMPT
        command = (f"mysql -u%s -p%s -D%s < ." % (dbuser, dbpasswd, dbname)) + relpath
        print(f"Executing " + command + " to load...\n")
        print(f"-------------------------------\n")
        try:
            os.system(command)
        except OSError as e:
            print("Exception", e)
        print(f"Finished loading " + cur_filename + "...\n")
        print(f"------------------------------\n")

# Confirm the created entities
print(f"Confirming database load by listing the table names from 'project2' database...\n")
print(f"------------------------------\n")
cursor = conn.cursor()
db_tables = cursor.fetchall()
for table in range(len(db_tables)):
    print(db_tables[table])
print(f"------------------------------\n")

# Capture the current time as end time
end_time = time.time()

# Compute elapsed_time
elapsed_time = end_time - start_time

print("Time taken for database load is: " + getFormattedTime(elapsed_time) + "\n")
conn.close()