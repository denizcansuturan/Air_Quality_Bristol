import pandas as pd
from sqlalchemy import *

# Import data from CSV files ensuring that the CSV files are encoded in 'utf-8' for consistent character representation

schema = pd.read_csv("TASK3/Schema.csv", encoding='utf-8')
constituency = pd.read_csv("TASK3/Constituency.csv")
station = pd.read_csv("TASK3/Station.csv")
readings = pd.read_csv("TASK3/cleansed_dataset.csv")

# connect to database

try:
    engine = create_engine("mysql+pymysql://{user}:{pw}@localhost/mydb".format(user="root", pw=""))

    # Insert data into the database tables using to_sql function
    # 'if_exists="replace"' will replace existing tables with new data

    schema.to_sql("schema", con=engine, index=False, if_exists="replace")
    readings.to_sql("readings", con=engine, index=False, if_exists="replace")
    station.to_sql("station", con=engine, index=False, if_exists="replace")
    constituency.to_sql("constituency", con=engine, index=False, if_exists="replace")

# Print any exceptions that occur during the database connection or data insertion
except Exception as err:
    print(f"Unexpected {err=}, {type(err)=}")
    exit(1)





