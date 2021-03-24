# Banking System

Banking system to create New Customer, Withdraw, Deposit and/or Check Balance.

## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install pyodbc.

```bash
pip install pyodbc
```

## Database table
SQL Server ODBC connection
TABLE - Account_Transaction
--Script to create table--
CREATE TABLE Account_Transaction (	
	Transaction_Num int NOT NULL identity,
	Customer_Name varchar(100) not null,
	Pin_Num int NOT NULL,
	Account_Type varchar(50),
	Transaction_Type varchar(20), 	
	Amount float,
	Transaction_Date datetime DEFAULT GETDATE()
	PRIMARY KEY (Transaction_Num)	
	)

## Usage
Create new customer account - Parameters (Pin Number, Account type, Customer Name, Amount)
Creates new customer account if account doesn't exist for the given Customer Name, Pin number and account type.

Withdraw Money - Parameters ((Pin Number, Account type, Customer Name, Amount)
Check for total amout for Customer. If withdraw amount is greater then total account amount then exit. Otherwise insert withdraw record to database.

Deposit Money - Parameters (Pin Number, Account type, Customer Name, Amount)
Check if account exists, if not exit, otherwise insert record to database.

Balance Check - Parameters (Pin Number, Account type, Customer Name)
Check for total amout for the customer.