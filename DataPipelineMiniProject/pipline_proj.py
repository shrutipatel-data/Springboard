import pyodbc
import pandas as pd

driver = 'SQL Server'
Servername = 'corplve8655a'
database_name = 'Springboard'

conn_string = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER=corplve8655a;DATABASE=Springboard;Trusted_Connection=yes;'
conn = pyodbc.connect(conn_string)

file_path_csv = "C:\\SpringBoard\\Pipeline_mini_project\\third_party_sales_1.csv"
#colnames = ['ticket_id', 'trans_date', 'event_id', 'event_name', 'event_date', 'event_type', 'event_city', 'customer_id', 'price', 'num_tickets']

df = pd.read_csv(file_path_csv,header=None)

records = df.values.tolist()

for i in records:
    sql_insert = '''
    Insert Into [third_party_sales]
                ([ticket_id]
            ,[trans_date]
            ,[event_id]
            ,[event_name]
            ,[event_date]
            ,[event_type]
            ,[event_city]
            ,[customer_id]
            ,[price]
            ,[num_tickets])
    VALUES (?,?,?,?,?,?,?,?,?,?)
    '''
    cursor = conn.cursor()
    cursor.execute(sql_insert, i)
    cursor.commit();

print("All records inserted")

def query_popular_tickets(connection):
    # Get the most popular ticket in the past month
    sql_statement = "select distinct event_name from third_party_sales where num_tickets = (select max(num_tickets) from third_party_sales);"
    #cursor = connection.cursor()
    connection.execute(sql_statement)
    records = connection.fetchall()
    #connection.close()
    return records

mostPopular = query_popular_tickets(cursor)
cursor.close()

for i in mostPopular:
    print (' '.join(map(str, i)))
