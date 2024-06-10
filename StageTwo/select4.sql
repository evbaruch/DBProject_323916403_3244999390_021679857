/*
Documentation for SQL Query

Purpose:
---------
To identify VIP customers with accounts that have not had any transactions in the past 12 months. This report helps in identifying potentially dormant VIP accounts for follow-up or re-engagement efforts.

Context and Story:
-------------------
As part of customer relationship management at a bank, it’s important to monitor VIP customers' account activity. Identifying VIP accounts with no transactions in the past year can indicate potentially dormant accounts or customers who may require attention. The bank's goal is to proactively reach out to these high-value customers to re-engage them, ensuring continued loyalty and activity.

Explanation:
-------------
This query retrieves details of VIP customers whose accounts have not had any transactions in the past 12 months. Here’s how it works:

1. SELECT Clause:
   - c.FirstName, c.LastName: Retrieves the first and last names of the customers.
   - a.Balance: Retrieves the balance of each account.
   - v.PositiveInterest: Retrieves the positive interest rate or similar VIP-specific benefit from the VIP table.

2. FROM Clause:
   - The query starts with the Customer table (c), which holds customer information.
   - JOIN Rel5 r ON c.CustomerID = r.CustomerID: Joins the Rel5 table to link customers to their accounts via CustomerID.
   - JOIN Account a ON r.AccountID = a.AccountID: Joins the Account table to get account details, including balance.
   - JOIN Vip v ON a.AccountID = v.AccountID: Joins the Vip table to identify VIP accounts and retrieve VIP-specific data.

3. WHERE Clause:
   - NOT EXISTS (SELECT 1 FROM Transactions t WHERE t.AccountID = a.AccountID AND t.TransactionDate > ADD_MONTHS(SYSDATE, -12)): Filters out accounts that have had any transactions in the past 12 months.
     - `SELECT 1 FROM Transactions t WHERE t.AccountID = a.AccountID AND t.TransactionDate > ADD_MONTHS(SYSDATE, -12)`: The subquery checks for the existence of any transaction within the last 12 months.
     - `NOT EXISTS` ensures that only accounts without such transactions are included.

4. ORDER BY Clause:
   - ORDER BY c.LastName, c.FirstName: Sorts the results by the customers' last names and first names in alphabetical order, making it easier to identify and contact these customers.

By using this query, the bank can identify potentially dormant VIP accounts and take proactive steps to re-engage these high-value customers, ensuring they remain active and valued members of the bank.
*/

SELECT 
    c.FirstName,
    c.LastName,
    a.Balance,
    v.PositiveInterest
FROM 
    Customer c
JOIN 
    Rel5 r ON c.CustomerID = r.CustomerID
JOIN 
    Account a ON r.AccountID = a.AccountID
JOIN 
    Vip v ON a.AccountID = v.AccountID
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM Transactions t
        WHERE t.AccountID = a.AccountID
        AND t.TransactionDate > ADD_MONTHS(SYSDATE, -12)
    )
ORDER BY 
    c.LastName, c.FirstName;
