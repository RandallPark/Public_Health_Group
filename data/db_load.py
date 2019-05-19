from os import system

from config import dbuser, dbpasswd, dbhost, dbport, dbname 

FILE =  "db.sql"
command = """mysql -u %s -p"%s" --host %s --port %s %s < %s --silent --force -b 2> nul""" %(dbuser, dbpasswd, dbhost, dbport, dbname, FILE)
system(command)
