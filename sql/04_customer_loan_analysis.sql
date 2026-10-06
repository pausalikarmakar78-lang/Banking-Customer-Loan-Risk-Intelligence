USE banking_analytics;
SELECT
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    c.Credit_Score,
    c.Annual_Income,
    l.Loan_ID,
    l.Loan_Type,
    l.Loan_Amount,
    l.Loan_Status
FROM customers c
INNER JOIN loans l
    ON c.Customer_ID = l.Customer_ID
LIMIT 20;

SELECT
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    c.Account_Balance,
    COUNT(l.Loan_ID) AS total_loans,
    COALESCE(SUM(l.Loan_Amount), 0) AS total_loan_amount
FROM customers c
LEFT JOIN loans l
    ON c.Customer_ID = l.Customer_ID
GROUP BY
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    c.Account_Balance
ORDER BY total_loan_amount DESC
LIMIT 20;

SELECT
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    b.State,
    COUNT(l.Loan_ID) AS total_loans,
    SUM(l.Loan_Amount) AS total_loan_amount,
    AVG(l.Loan_Amount) AS average_loan_amount
FROM branches b
LEFT JOIN loans l
    ON b.Branch_ID = l.Branch_ID
GROUP BY
    b.Branch_ID,
    b.Branch_Name,
    b.City,
    b.State
ORDER BY total_loan_amount DESC;

SELECT
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    c.Credit_Score,
    c.Annual_Income,
    COUNT(l.Loan_ID) AS total_loans,
    SUM(l.Default_Flag) AS defaulted_loans
FROM customers c
INNER JOIN loans l
    ON c.Customer_ID = l.Customer_ID
GROUP BY
    c.Customer_ID,
    c.First_Name,
    c.Last_Name,
    c.Credit_Score,
    c.Annual_Income
HAVING SUM(l.Default_Flag) > 0
ORDER BY defaulted_loans DESC;