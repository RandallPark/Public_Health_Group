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
- Go to the `data` folder of this repository.
- Pull all files in the `data` folder and keep together in your local folder.
- Open a command prompt, navigate to script/file location and run: ` >>> python db_load.py`
