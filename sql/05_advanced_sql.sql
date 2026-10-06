USE banking_analytics;
WITH customer_risk AS (
    SELECT
        c.Customer_ID,
        c.First_Name,
        c.Last_Name,
        c.Credit_Score,
        c.Annual_Income,
        COUNT(l.Loan_ID) AS total_loans,
        COALESCE(SUM(l.Loan_Amount), 0) AS total_loan_amount,
        COALESCE(SUM(l.Default_Flag), 0) AS defaulted_loans
    FROM customers c
    LEFT JOIN loans l
        ON c.Customer_ID = l.Customer_ID
    GROUP BY
        c.Customer_ID,
        c.First_Name,
        c.Last_Name,
        c.Credit_Score,
        c.Annual_Income
)

SELECT *
FROM customer_risk
ORDER BY defaulted_loans DESC, total_loan_amount DESC
LIMIT 20;



WITH customer_risk AS (
    SELECT
        c.Customer_ID,
        c.First_Name,
        c.Last_Name,
        c.Credit_Score,
        c.Annual_Income,
        COUNT(l.Loan_ID) AS total_loans,
        COALESCE(SUM(l.Loan_Amount), 0) AS total_loan_amount,
        COALESCE(SUM(l.Default_Flag), 0) AS defaulted_loans
    FROM customers c
    LEFT JOIN loans l
        ON c.Customer_ID = l.Customer_ID
    GROUP BY
        c.Customer_ID,
        c.First_Name,
        c.Last_Name,
        c.Credit_Score,
        c.Annual_Income
)

SELECT *
FROM customer_risk
WHERE Credit_Score < 600
  AND defaulted_loans > 0
ORDER BY total_loan_amount DESC;

USE banking_analytics;
SELECT
    Customer_ID,
    First_Name,
    Last_Name,
    Account_Balance,
    RANK() OVER (
        ORDER BY Account_Balance DESC
    ) AS balance_rank
FROM customers
ORDER BY balance_rank
LIMIT 20;

WITH branch_loans AS (
    SELECT
        b.Branch_ID,
        b.Branch_Name,
        b.City,
        b.State,
        COUNT(l.Loan_ID) AS total_loans,
        COALESCE(SUM(l.Loan_Amount), 0) AS total_loan_amount
    FROM branches b
    LEFT JOIN loans l
        ON b.Branch_ID = l.Branch_ID
    GROUP BY
        b.Branch_ID,
        b.Branch_Name,
        b.City,
        b.State
)

SELECT
    Branch_ID,
    Branch_Name,
    City,
    State,
    total_loans,
    total_loan_amount,
    RANK() OVER (
        ORDER BY total_loan_amount DESC
    ) AS branch_rank
FROM branch_loans
ORDER BY branch_rank;

SELECT
    Loan_ID,
    Customer_ID,
    Loan_Type,
    Loan_Amount,
    RANK() OVER (
        PARTITION BY Loan_Type
        ORDER BY Loan_Amount DESC
    ) AS loan_rank
FROM loans
ORDER BY Loan_Type, loan_rank
LIMIT 50;


USE banking_analytics;

WITH monthly_transactions AS (
    SELECT
        DATE_FORMAT(Transaction_Date, '%Y-%m') AS transaction_month,
        COUNT(*) AS total_transactions,
        SUM(Transaction_Amount) AS monthly_transaction_amount
    FROM transactions
    GROUP BY DATE_FORMAT(Transaction_Date, '%Y-%m')
)

SELECT
    transaction_month,
    total_transactions,
    monthly_transaction_amount,
    SUM(monthly_transaction_amount) OVER (
        ORDER BY transaction_month
    ) AS running_transaction_amount
FROM monthly_transactions
ORDER BY transaction_month;