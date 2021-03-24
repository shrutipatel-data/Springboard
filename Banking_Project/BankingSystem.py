import Customer 
import Transaction
import pyodbc
import logging
import os

def createLogfile():
    if os.path.exists("logfilename.log"):
        os.remove("logfilename.log")
    logging.basicConfig(
    filename="logfilename.log",    
    format='%(asctime)s %(levelname)-8s %(message)s',
    level=logging.INFO,
    datefmt='%Y-%m-%d %H:%M:%S')

def exit_system():
    print("Thank you for using our banking system!")        
    quit()

def main():      
    '''Takes input parameters from customer. Based on customer selection Create account, Withdraw, Deposit and Balance methods gets call.'''
    
    createLogfile()            
    print("========== 1. Open New Account ============")
    print("========== 2. Withdraw ============")
    print("========== 3. Deposit  ============")
    print("========== 4. Check Balance ============")
    print("========== 5. Quit ============")

    EnterNumber = int(input("Select a Number from the above menu : "))
    
    trans = Transaction.account_transaction()

    name = input("Enter the account holder name : ")
    accType = input("Enter the type of account [C/S]: ")    
    pinNum = int(input("Enter your PIN number: "))
    
    if(accType == 'C'):
        accType = 'Checking'
    elif(accType == 'S'):
        accType = 'Saving'

    if (EnterNumber == 1):        
        newCust = Customer.customer(name)
        amount = int(input("Enter the ammount: "))        
        newCust.createAccount(accType, pinNum, amount)
    elif (EnterNumber == 2):        
        amount = int(input("Enter the ammount: "))        
        trans.withdraw(name, accType, pinNum, amount)
    elif (EnterNumber == 3):        
        amount = int(input("Enter the ammount: "))        
        trans.deposit (name, accType, pinNum, amount)
    elif (EnterNumber == 4):                    
        print("Your current balance: " +  str(trans.balance(pinNum, name, accType)))
    else:
        exit_system()

if __name__ == "__main__":
    main()   



