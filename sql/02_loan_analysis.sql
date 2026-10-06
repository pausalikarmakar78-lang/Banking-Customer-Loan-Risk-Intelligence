USE banking_analytics;
SELECT
    Loan_Type,
    COUNT(*) AS total_loans,
    SUM(Loan_Amount) AS total_loan_amount,
    AVG(Loan_Amount) AS average_loan_amount
FROM loans
GROUP BY Loan_Type
ORDER BY total_loan_amount DESC;
SELECT
    Loan_Status,
    COUNT(*) AS total_loans,
    SUM(Loan_Amount) AS total_loan_amount
FROM loans
GROUP BY Loan_Status
ORDER BY total_loans DESC;

SELECT
    Loan_Type,
    AVG(Interest_Rate) AS average_interest_rate
FROM loans
GROUP BY Loan_Type
ORDER BY average_interest_rate DESC;

SELECT
    Loan_Term_Months,
    COUNT(*) AS total_loans,
    AVG(Loan_Amount) AS average_loan_amount
FROM loans
GROUP BY Loan_Term_Months
ORDER BY Loan_Term_Months;