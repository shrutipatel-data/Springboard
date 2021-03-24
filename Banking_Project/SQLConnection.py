import pyodbc
import logging

class sql:  
    '''This class creates SQL Server connection, executes, commit, fetch all rows, row counts, fetch one row'''
    def __init__(self, name):
        self._conn = pyodbc.connect(name)
        self._cursor = self._conn.cursor()

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.close()

    @property
    def connection(self):
        return self._conn

    @property
    def cursor(self):
        return self._cursor

    def execute(self, sql, params=None):
        self.cursor.execute(sql, params or ())
    
    def commit(self):
        self.connection.commit()

    def rows(self):
        return self.cursor.rowcount
    
    def fetchall(self):
        return self.cursor.fetchall()

    def fetchone(self):
        return self.cursor.fetchone()

    def query(self, sql, params=None):
        self.cursor.execute(sql, params or ())
        return self.fetchall()

    def close(self, commit=True):
        if commit:
            self.commit()
        self.connection.close()
    
    def sqlInsertTrans(self, custName, pinNum, accType, transaction, amount):
        '''Inserts record to th Account_Transaction table'''

        self.custName = custName
        self.accType = accType
        self.pinNum = pinNum
        self.transaction = transaction
        self.amount = amount

        try:
            with sql('DRIVER={ODBC Driver 17 for SQL Server};SERVER=corplve8655a;DATABASE=Springboard;Trusted_Connection=yes;') as db:
                insert = "INSERT INTO [dbo].[Account_Transaction] ([Customer_Name],[Pin_Num],[Account_Type],[Transaction_Type],[Amount]) VALUES (?, ?, ?, ?, ?) "
                db.execute(insert, (self.custName, self.pinNum, self.accType, self.transaction, self.amount))
                db.commit()                
        except:
            print("Cannot insert record to database.")