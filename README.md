<<<<<<< HEAD
# Public_Health_Group
public health project for USC Bootcamp.
---
---
## TODO
- Create master readme in main folder with general directions
- Create data loading readme in data folder for load directions.
- Create app readme in app folder for setting up website
---
## Data Information
Data is for year 2016 only and was obtained from the following:
- admissions.csv and discharges.csv - https://www.samhsa.gov/data/report/treatment-episode-data-set-teds-2016-admissions-and-discharges-publicly-funded-substance-use
- DRUG_DEATHS2016_ADDED_REGION.csv - https://www.cdc.gov/nchs/pressroom/sosmap/drug_poisoning_mortality/drug_poisoning.htm

### Requirements
---
` MySQL database `
` Python `

### How to Load the Data
---
 - **Rename** [`config_temp.py`](config_temp.py) to [`config.py`](config.py). 
 - Update the database credentials for your local MySQL instance. **Be aware** that SQLAlchemy uses different Dialects and the string for connecting to MySQL can be 'mysql' or 'mysql+pymysql' depending on your environment. This will be set in `config.py` as `dialect =`.
---
- Go to the `data_master` folder of this repository.
- Pull all files in the `data_master` folder and keep together in your local folder.
- Open a command prompt, navigate to script/file location and run: ` >>> python db_load.py`
=======
# Public_Health_Group #
public health project for USC Bootcamp.
# DATABASE EXPORT and IMPORT INSTRUCTIONS - (to be merged with the final Project ReadMe) #
**Team:** Jamuna, Eddie, Warren and Anna
**Title:** Substance Abuse in Young Adults of USA

Steps to EXPORT database tables using mysqldump
---------------------------------------------------------------------
1.From Command Prompt (Terminal window):
---------------------------------------
1. Navigate to your project folder and to the /data_master folder.*Note: User needs have enough privilleges:*
2. Establish a connection to mysql using the following command:
**mysql -uroot -p -h127.0.0.1**
3. Within 'mysql>' prompt, type the following to start a large database dump using:
**project2 | gzip > project2_db_dump.sql.gz'**

2.Using MySql workbench tool:
---------------------------------------
*Note:By default, workbench creates dumps for each and every table.  Do not change this setting.*
1. Launch MySql workbench.
2. Establish a connection to the server at **127.0.0.1**
3. From the 'Navigator' panel, choose **'Administration'** tab.
4. From the **'Data Export'** panel, select the database to create a dump ('project2').
5. Make a note of the **'Export to Dump Project Folder'**. This is where the dump file be saved on completion of the dump process.
6. Click on the **'Advanced options...'** button on this panel.
7. Select the option **'compress - Use compression in server / client protocol'** (This is needed for large databases).
8. Click on **'<Return'** button.
9. Click on **'Start Export'** button. If you get a version mismatch error, follow the recommendations from **References#3** listed below (*make sure your path includes the mysqldump.exe in it*).
10. Wait for the export operation to complete. You can check the progress in the **'Data Export'** panel.
11. When done, check for the files and **filesizes** at the dump project folder mentioned in **Step#5** above. File size should be ~= 158 MB.

3.From Windows' File Explorer:
------------------------------
1. **Navigate** to your project directory and /data_master folder.
2. Right click on **'dumps'**; choose **'Send to'->'Compressed(zipped) folder**.

---------------------------------------------------------------------

Steps to IMPORT from zipped file:
---------------------------------------------------------------------
*Takes ~= 28 minutes and 11 seconds*
1. Open Windows **Command Prompt / Terminal window** (with needed user privilleges).
2. Change to the directory where the **'load_sqldump.py'** is located.
3. Start loading the database using the command;
**>python load_sqldumps.py**
Step#4. Confirm the load by logging into mysql and typing **'mysql>show databases' / mysql>use project2; / mysql>show tables;**

**References:**
----------------------------------------------------------------------
1.https://www.lullabot.com/articles/importexport-large-mysql-databases
2.https://stackoverflow.com/questions/19598797/is-there-any-way-to-show-progress-on-a-gunzip-database-sql-gz-mysql-pr
3.Mysqldump.exe and MysqlServer.exe version (8.x vs 5.7x) mismatch error(Fixed as per:
             https://stackoverflow.com/questions/15644697/mysqlworkbench-giving-version-error-on-exporting-database)
----------------------------------------------------------------------
>>>>>>> 274407e8846571a59c4d0572711c8e77fd934199
