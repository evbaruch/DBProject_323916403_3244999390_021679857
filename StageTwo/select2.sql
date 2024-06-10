/*
Documentation for SQL Query

Purpose:
---------
To generate a list of customer transactions for the previous month. This report is useful for analyzing customer activity over a recent period and understanding their transaction patterns.

Context and Story:
-------------------
As part of your responsibilities at a bank, you need to provide insights into recent customer transactions to understand spending patterns and identify any unusual activities. Management requires a detailed view of all transactions that occurred in the previous month for analysis and reporting purposes. This information helps in tracking customer behavior, identifying trends, and ensuring compliance with financial regulations.

Explanation:
-------------
This query retrieves transaction details for each customer for the previous month. Here’s how it works:

1. SELECT Clause:
   - c.FirstName, c.LastName: Retrieves the first and last names of the customers associated with each transaction.
   - t.TransactionDate: Retrieves the date on which each transaction occurred.
   - t.TransactionType: Retrieves the type of transaction (e.g., deposit, withdrawal).
   - t.Amount: Retrieves the amount involved in each transaction.

2. FROM Clause:
   - The query starts with the Transactions table (t), which holds transaction details.
   - JOIN Account a ON t.AccountID = a.AccountID: Joins the Account table to associate each transaction with its account.
   - JOIN Rel5 r ON a.AccountID = r.AccountID: Joins the Rel5 table to link each account with its customer.
   - JOIN Customer c ON r.CustomerID = c.CustomerID: Joins the Customer table to get customer details for each account.

3. WHERE Clause:
   - t.TransactionDate BETWEEN ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1)): Filters the transactions to include only those that occurred in the previous month. 
     - `TRUNC(SYSDATE, 'MM')` truncates the current date (`SYSDATE`) to the first day of the current month.
     - `ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1)` moves this date one month back to the first day of the previous month.
     - `LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1))` gets the last day of the previous month.

4. ORDER BY Clause:
   - ORDER BY c.LastName, c.FirstName, t.TransactionDate DESC: Sorts the results first by customer's last name, then by first name, and finally by transaction date in descending order. This organizes the output to show recent transactions first for each customer, and customers in alphabetical order by name.

By using this query, the bank can efficiently monitor and analyze transaction activities of customers for the last month, enabling better customer service and risk management.
*/

SELECT 
    c.FirstName,
    c.LastName,
    t.TransactionDate,
    t.TransactionType,
    t.Amount
FROM 
    Transactions t
JOIN 
    Account a ON t.AccountID = a.AccountID
JOIN 
    Rel5 r ON a.AccountID = r.AccountID
JOIN 
    Customer c ON r.CustomerID = c.CustomerID
WHERE 
    t.TransactionDate BETWEEN ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1))
ORDER BY 
    c.LastName, c.FirstName, t.TransactionDate DESC;
