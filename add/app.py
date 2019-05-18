import numpy as np
import sqlalchemy
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.automap import automap_base
from sqlalchemy.orm import Session
from sqlalchemy.orm import scoped_session
from sqlalchemy.orm import sessionmaker
from sqlalchemy import create_engine, func

from flask import Flask, jsonify
# PyMySQL 
import pymysql
pymysql.install_as_MySQLdb()

# Import other python files
import data_functions
#--------------------------------------------------
#   ERROR HANDLER CODE
#   A user defined class to use in try-catch blocks
#--------------------------------------------------
class UserDefinedError(Exception):
    status_code = 415

    def __init__(self, message, status_code=None):
        Exception.__init__(self)
        self.message = message
        if status_code is not None:
            self.status_code = status_code
    def to_dict(self):
        rv = dict(self)
        rv['message'] = self.message
        return rv

# Calling etl.py's etl_data function
try:
    get_data(dataObj)
except: 
    raise UserDefinedError('ETL operation failed in ''etl.py', status_code = 430)

# Flask setup
app = Flask(__name__)

hello_dict = {"Hello": "World!"}

# Flask Routes
@app.route("/")
def index():
    """List all available api routes."""
    return (
        f"Available Routes:<br/>"
        f"/map<br/>"
        f"/states<br/>"
        f"/jsonified<br/>"
    )

# This routes to a page with a choroplot map 
# with tooltip display on hover feature
@app.route("/map", methods=['GET'])
def map():
    return hello_dict

# This routes to a page with selected state with abbreviated code
# Without <abbr> displays the index page with 
# a states drop-down.
@app.route("/states/<abbr>", methods=['GET'])
def map(abbr):
    return hello_dict

# This routes to a page with dashboard 
# with quantitative bar, pie and line plots
@app.route("/age-groups/<int:group>", methods=['GET'])
def map(group):
    return hello_dict

#This routes to a page with a jsonified object
@app.route("/jsonified")
def jsonified():
    return jsonify(hello_dict)

if __name__ == "__main__":
    app.run(debug=True)