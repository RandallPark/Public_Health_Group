from sqlalchemy import create_engine

dbuser = "root"
dbpasswd = "root"
dbhost = "localhost"
dbport = 3306
dbname = "patient_info"

##create_engine may require pymysql depending on operating environment
#engine = create_engine('mysql+pymysql://root:root@localhost')
engine = create_engine('mysql://root:root@localhost')