/*
Documentation for SQL Query

Purpose:
---------
To generate a report of VIP customers with accounts that have had no transactions since their opening. This report helps in identifying VIP accounts that might be inactive or dormant, prompting potential re-engagement efforts.

Context and Story:
-------------------
As a data analyst at a bank, you need to identify VIP customers whose accounts have not seen any transaction activity since their creation. Management is interested in these accounts because inactivity might indicate a risk of dormancy or customer disengagement. By identifying these accounts, the bank can take proactive measures to re-engage these high-value customers, ensuring they remain active and continue benefiting from the bank's services.

Explanation:
-------------
This query retrieves details of VIP customers whose accounts have had no transactions since they were opened. Here�s how it works:

1. SELECT Clause:
   - `c.FirstName, c.LastName`: Retrieves the first and last names of the customers.
   - `a.Balance`: Retrieves the current balance of each account.
   - `v.PositiveInterest`: Retrieves the positive interest rate or other VIP-specific benefits associated with each account from the `Vip` table.

2. FROM Clause:
   - The query starts with the `Customer` table (`c`), which holds information about customers.
   - `JOIN Rel5 r ON c.CustomerID = r.CustomerID`: Joins the `Rel5` table to link customers to their accounts using `CustomerID`.
   - `JOIN Account a ON r.AccountID = a.AccountID`: Joins the `Account` table to get account details, including balance, using `AccountID`.
   - `JOIN Vip v ON a.AccountID = v.AccountID`: Joins the `Vip` table to identify VIP accounts and retrieve VIP-specific data using `AccountID`.

3. WHERE Clause:
   - `NOT EXISTS (SELECT 1 FROM Transactions t WHERE t.AccountID = a.AccountID)`: Ensures that the account has no transactions.
     - `SELECT 1 FROM Transactions t WHERE t.AccountID = a.AccountID`: Checks for any transaction activity associated with the account.
     - `NOT EXISTS`: Filters out accounts with any transactions, thereby including only those with no transaction activity since account opening.

4. ORDER BY Clause:
   - `ORDER BY c.LastName, c.FirstName`: Sorts the results alphabetically by customers' last names and first names, facilitating easier identification and follow-up actions.

By using this query, the bank can identify VIP accounts that might need attention due to their lack of transaction activity, enabling targeted customer outreach and engagement strategies.
*/

SELECT 
    c.FirstName,
    c.LastName,
    a.Balance,
    v.PositiveInterest
FROM 
    Customer c
JOIN 
    Relationship r ON c.CustomerID = r.CustomerID
JOIN 
    Account a ON r.AccountID = a.AccountID
JOIN 
    Vip v ON a.AccountID = v.AccountID
WHERE 
    NOT EXISTS (
        SELECT 1
        FROM Transactions t
        WHERE t.AccountID = a.AccountID
    )
ORDER BY 
    c.LastName, c.FirstName;
