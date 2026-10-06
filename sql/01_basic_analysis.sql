DROP DATABASE IF EXISTS banking_analytics;
CREATE DATABASE banking_analytics;
USE banking_analytics;
DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    Customer_ID VARCHAR(20),
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Gender VARCHAR(20),
    Date_of_Birth DATE,
    Age INT,
    City VARCHAR(100),
    State VARCHAR(100),
    Branch_ID VARCHAR(20),
    Account_Type VARCHAR(50),
    Account_Balance DECIMAL(15,2),
    Credit_Score INT,
    Occupation VARCHAR(100),
    Annual_Income DECIMAL(15,2),
    Join_Date DATE
);
LOAD DATA LOCAL INFILE 'C:/Users/hp/Documents/Banking-Analytics/data/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
SELECT COUNT(*) AS total_customers
FROM customers;
SELECT *
FROM customers
LIMIT 5;

USE banking_analytics;
DROP TABLE IF EXISTS loans;
CREATE TABLE loans (
    Loan_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Branch_ID VARCHAR(20),
    Loan_Type VARCHAR(50),
    Loan_Amount DECIMAL(15,2),
    Interest_Rate DECIMAL(5,2),
    Loan_Term_Months INT,
    Loan_Status VARCHAR(30),
    Default_Flag INT,
    Start_Date DATE,
    End_Date DATE
);
LOAD DATA LOCAL INFILE 'C:/Users/hp/Documents/Banking-Analytics/data/loans.csv'
INTO TABLE loans
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_loans
FROM loans;
SELECT *
FROM loans
LIMIT 5;

USE banking_analytics;
DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
    Transaction_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Account_Number VARCHAR(30),
    Transaction_Date DATE,
    Transaction_Type VARCHAR(50),
    Transaction_Amount DECIMAL(15,2),
    Transaction_Status VARCHAR(30),
    Branch_ID VARCHAR(20)
);
LOAD DATA LOCAL INFILE 'C:/Users/hp/Documents/Banking-Analytics/data/transactions.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_transactions
FROM transactions;

USE banking_analytics;
DROP TABLE IF EXISTS branches;
CREATE TABLE branches (
    Branch_ID VARCHAR(20),
    Branch_Name VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100)
);
LOAD DATA LOCAL INFILE 'C:/Users/hp/Documents/Banking-Analytics/data/branches.csv'
INTO TABLE branches
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_branches
FROM branches;
SELECT *
FROM branches
LIMIT 10;

USE banking_analytics;
CREATE TABLE payments (
    Payment_ID VARCHAR(20),
    Loan_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Payment_Date DATE,
    Payment_Amount DECIMAL(15,2),
    Payment_Status VARCHAR(30),
    Branch_ID VARCHAR(20)
);
LOAD DATA LOCAL INFILE 'C:/Users/hp/Documents/Banking-Analytics/data/payments.csv'
INTO TABLE payments
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT COUNT(*) AS total_payments
FROM payments;
SELECT *
FROM payments
LIMIT 5;

SELECT SUM(Loan_Amount) AS total_loan_amount
FROM loans;
SELECT AVG(Loan_Amount) AS average_loan_amount
FROM loans;
SELECT AVG(Credit_Score) AS average_credit_score
FROM customers;
SELECT AVG(Account_Balance) AS average_account_balance
FROM customers;
SELECT AVG(Annual_Income) AS average_annual_income
FROM customers;
SELECT Loan_Status, COUNT(*) AS loan_count
FROM loans
GROUP BY Loan_Status;
SELECT Loan_Type, COUNT(*) AS loan_count
FROM loans
GROUP BY Loan_Type;