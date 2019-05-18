from os import system
USERNAME = "root"
PASSWORD = "root"
DBNAME = "project2"
HOST = "localhost"
PORT = 3306
FILE =  "db.sql"
command = """mysql -u %s -p"%s" --host %s --port %s %s < %s --silent --force -b 2> nul""" %(USERNAME, PASSWORD, HOST, PORT, DBNAME, FILE)
system(command)