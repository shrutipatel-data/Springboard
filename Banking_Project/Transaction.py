from SQLConnection import sql
import logging

class account_transaction:  
    '''Class has different methods for account transaction'''
    
    db = sql('DRIVER={ODBC Driver 17 for SQL Server};SERVER=corplve8655a;DATABASE=Springboard;Trusted_Connection=yes;')

    def deposit(self, name, accType, pinNum, amount):
        '''This method inserts deposit amount to the Account_Transaction table for an existing cusomer'''
        
        self.name = name
        self.accType = accType        
        self.pinNum = pinNum
        self.amount = amount
        
        logging.info('Deposit - Insert amount to customer account')

        with self.db:
            customerCheck = "SELECT COUNT(*) FROM [dbo].[Account_Transaction]  WHERE Pin_Num = ? AND customer_name = ? AND Account_Type = ? "
            self.db.execute(customerCheck, (self.pinNum, self.name,  self.accType))
            rowCount = self.db.fetchone()[0]
            print(rowCount)
            if rowCount == 0:
                print("Account doesn't exists.") 
            else: 
                self.db.sqlInsertTrans(self.name, self.pinNum, self.accType, 'Deposit', self.amount)                   
                print("Deposit completed successfully.")
        
    def withdraw(self, name, accType, pinNum, amount):
        '''This method inserts withdraw amount to the Account_Transaction table for an existing cusomer'''

        self.name = name
        self.accType = accType
        self.pinNum = pinNum
        self.amount = amount

        balance = self.balance(self.pinNum, self.name, self.accType)
        if(int(balance) < self.amount):
            print("Withdraw amount exceed total account amount.")
            quit()        

        logging.info('Withdraw - withdraw amount from customer account')
        self.amount = self.amount * -1        
        self.db.sqlInsertTrans(self.name, self.pinNum, self.accType, 'Withdraw', self.amount)        
        print("Withdraw completed successfully.")
        
    def balance(self, pinNum, name, accType):        
        '''This method retuns the sum of total amount.'''

        self.pinNum = pinNum
        self.name = name
        self.accType = accType         

        logging.info('Check Balance')
        with self.db:
            logging.info("Balance check - DB Connection completed.")
            selectBalance = "SELECT SUM(Amount) as amt FROM [dbo].[Account_Transaction]  WHERE Pin_Num = ? AND customer_name = ? AND Account_Type = ? "            
            row = self.db.query(selectBalance, (self.pinNum, self.name, self.accType))   
            a = -1                     
            for i in list(row):
                a = i[0]                
        if a is not None:
            return a         
        else:        
            print("Account doesn't exist. ")
            quit()        

    