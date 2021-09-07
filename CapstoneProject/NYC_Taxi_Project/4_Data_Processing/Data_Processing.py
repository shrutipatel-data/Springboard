import os
import pandas as pd
import sqlalchemy
import pyodbc
from sqlalchemy import sql
from sqlalchemy import create_engine
import urllib
import logging

from sqlalchemy.sql.expression import false

# Parameters
LOG_FILE = 'app.log'
DATE_FMT = '%Y-%m-%d %H:%M:%S'

# Logging setup
logging.basicConfig(level=logging.INFO,
                    format='%(asctime)s - %(message)s',
                    datefmt=DATE_FMT,
                    handlers=[logging.FileHandler(LOG_FILE), logging.StreamHandler()]) # Log to file and stdout

logging.info('Initiating data processing...')

#Setting variables for Symedical connection
DB_HOST = 'CORPLVE8655A' # os.environ['SYM_HOST']\n",
DB_Name = 'NYC_Taxi' # os.environ['SYM_DB']\n",

#ms_engine = sqlalchemy.create_engine("mssql+pyodbc://"+ DB_HOST + "/" + DB_Name + "?driver=ODBC Driver 17 for SQL Server?trusted_connection=yes?")
#engine = sqlalchemy.create_engine('DRIVER={ODBC Driver 17 for SQL Server};SERVER=corplve8655a;DATABASE=Springboard;Trusted_Connection=yes;')

conn_str = (
    r'Driver=ODBC Driver 17 for SQL Server;'
    r'Server=CORPLVE8655A;'
    r'Database=NYC_Taxi;'
    r'Trusted_Connection=yes;'
)
quoted_conn_str = urllib.parse.quote_plus(conn_str)
engine = create_engine(f'mssql+pyodbc:///?odbc_connect={quoted_conn_str}')
logging.info('Created engine...')

with os.scandir('C:\\SpringBoard\\CapstoneProject\\Project_1\\NYC_Taxi\\RawData') as i:
    for entry in i:
        if (entry.name == 'taxi+_zone_lookup.csv'):            
            logging.info('Filename - ' + entry.name)
            logging.info("********* Data Load for " + entry.name + " Started *********")
            zone_df = pd.read_csv(entry.path, sep=",", header=0, index_col=False,  error_bad_lines=False)
            logging.info(zone_df.columns)                                                       
            zone_df.to_sql('TAXI_ZONE_DM', engine, if_exists='append', index=false,
                dtype={"locationID": sqlalchemy.INTEGER,
                "borough":sqlalchemy.VARCHAR(75),
                "zone": sqlalchemy.VARCHAR(100),
                "service_zone": sqlalchemy.VARCHAR(75)
                })
            logging.info("********* Data Load for " + entry.name + " completed *********")
        for month in range(1,2):
            if entry.name == "nyc.2020-{0:0=2d}.csv".format(month):
               logging.info(entry.name)
               logging.info("********* Data Load for " + entry.name + " Started *********")
               j, chunksize = 1, 100000
               for df in pd.read_csv(entry.path, chunksize=chunksize, iterator=True, sep=",", header=0, index_col=False,  error_bad_lines=False):
                    logging.info(df.columns)                                   
                    
                    df.to_sql('NYC_YELLOW_TAXI_TRIP_FC', engine, if_exists='append', index=false,
                    dtype={
                            "vendorID": sqlalchemy.INTEGER,
                            "tpep_pickup_datetime": sqlalchemy.DATETIME,
                            "tpep_dropoff_datetime": sqlalchemy.DATETIME,
                            "passenger_count": sqlalchemy.INTEGER,
                            "trip_distance": sqlalchemy.Float,
                            "RatecodeID": sqlalchemy.INTEGER,
                            "store_and_fwd_flag": sqlalchemy.VARCHAR(5),
                            "PULocationID": sqlalchemy.INTEGER,
                            "DOLocationID": sqlalchemy.INTEGER,
                            "payment_type": sqlalchemy.INTEGER,
                            "fare_amount": sqlalchemy.FLOAT,
                            "extra": sqlalchemy.FLOAT,
                            "mta_tax": sqlalchemy.FLOAT,
                            "tip_amount": sqlalchemy.FLOAT,
                            "tolls_amount": sqlalchemy.FLOAT,
                            "improvement_surcharge": sqlalchemy.FLOAT,
                            "total_amount": sqlalchemy.FLOAT,
                            "congestion_surcharge": sqlalchemy.FLOAT                              
                        })

                    j = df.index[-1] + 1                    
                    del df
               logging.info("********* Data Load for " + entry.name + " Completed *********")
        