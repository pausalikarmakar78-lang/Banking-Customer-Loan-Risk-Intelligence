USE banking_analytics;
SELECT  
    COUNT(*) AS defaulted_loans
FROM loans
WHERE Default_Flag = 1;
SELECT
    COUNT(CASE WHEN Default_Flag = 1 THEN 1 END) * 100.0
    / COUNT(*) AS default_rate_percentage
FROM loans;
SELECT
    Loan_Type,
    COUNT(*) AS total_loans,
    SUM(Default_Flag) AS defaulted_loans,
    SUM(Default_Flag) * 100.0 / COUNT(*) AS default_rate_percentage
FROM loans
GROUP BY Loan_Type
ORDER BY default_rate_percentage DESC;
SELECT
    Loan_Status,
    COUNT(*) AS total_loans,
    SUM(Default_Flag) AS defaulted_loans,
    SUM(Default_Flag) * 100.0 / COUNT(*) AS default_rate_percentage
FROM loans
GROUP BY Loan_Status
ORDER BY default_rate_percentage DESC;
SELECT
    SUM(Loan_Amount) AS total_defaulted_loan_amount
FROM loans
WHERE Default_Flag = 1;
SELECT
    CASE
        WHEN Default_Flag = 1 THEN 'Defaulted'
        ELSE 'Not Defaulted'
    END AS default_category,
    COUNT(*) AS total_loans,
    AVG(Loan_Amount) AS average_loan_amount
FROM loans
GROUP BY Default_Flag;
SELECT
    CASE
        WHEN Default_Flag = 1 THEN 'Defaulted'
        ELSE 'Not Defaulted'
    END AS default_category,
    AVG(Interest_Rate) AS average_interest_rate
FROM loans
GROUP BY Default_Flag;

SELECT
    Loan_Term_Months,
    COUNT(*) AS total_loans,
    SUM(Default_Flag) AS defaulted_loans,
    SUM(Default_Flag) * 100.0 / COUNT(*) AS default_rate_percentage
FROM loans
GROUP BY Loan_Term_Months
ORDER BY Loan_Term_Months;
   