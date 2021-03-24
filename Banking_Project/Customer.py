from SQLConnection import sql
import logging

class person:
    def __init__(self, name):
        self.name = name
       
class customer(person):
    db = sql('DRIVER={ODBC Driver 17 for SQL Server};SERVER=corplve8655a;DATABASE=Springboard;Trusted_Connection=yes;')

    def createAccount(self, accType, pinNum, amount):
        '''This function creates new customer account into sql server database'''
        print("creatAccount method called")        
        self.accType = accType
        self.pinNum = pinNum
        self.amount = amount
        
        logging.info('Create new customer.')
        with self.db:
            customerCheck = "SELECT * FROM [dbo].[Account_Transaction]  WHERE Pin_Num = ? AND customer_name = ? AND Account_Type = ? "
            self.db.execute(customerCheck, (self.pinNum, self.name,  self.accType))
            rowCount = self.db.rows()
            
            if rowCount == -1:
                print("Account already exists.")               
            else: 
                insert = "INSERT INTO [dbo].[Account_Transaction] ([Customer_Name],[pin_Num],[Account_Type],[Transaction_Type],[Amount]) VALUES (?,?,?,?,?)"
                self.db.execute(insert, (self.name, self.pinNum, self.accType, 'Deposit', self.amount))
                self.db.commit()
                print("Account created successfully.")
                
      
                    