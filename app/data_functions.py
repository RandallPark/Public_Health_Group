import pandas
from sqlalchemy import create_engine

def engine():
    rds_connection_string = "root:root@127.0.0.1/customer_db"
    engine = create_engine(f'mysql+pymysql://{rds_connection_string}')
    return engine