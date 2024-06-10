/*
Documentation for SQL Query

Purpose:
---------
To increase the positive interest rate for VIP accounts that meet specific criteria. This operation incentivizes account holders with high balances and recent transaction activity by increasing their positive interest rate.

Explanation:
-------------
This query updates the positive interest rate for VIP accounts that meet certain criteria. Here’s how it works:

1. UPDATE Clause:
   - `UPDATE Vip`: Specifies that the Vip table will be updated.

2. SET Clause:
   - `PositiveInterest = PositiveInterest + 0.5`: Increases the positive interest rate for the selected VIP accounts by adding 0.5 to the current positive interest rate.

3. WHERE Clause:
   - `AccountID IN (SELECT a.AccountID ... )`: Specifies the condition for updating, where the AccountID of each row in the Vip table is checked against the list of AccountIDs retrieved from the subquery.
     - `SELECT a.AccountID ...`: Retrieves the AccountIDs of accounts that meet specific criteria.
     - `JOIN ... WHERE a.Balance > 10000 AND t.TransactionDate BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE`: Joins the Account and Transactions tables to identify accounts with balances greater than 10000 and transactions within the last 24 months.

By using this query, the database can incentivize account holders with high balances and recent transaction activity by increasing their positive interest rate, potentially encouraging them to continue using their accounts actively.
*/

UPDATE 
    Vip
SET 
    PositiveInterest = PositiveInterest + 0.5
WHERE 
    AccountID IN (
        SELECT 
            a.AccountID
        FROM 
            Account a
        JOIN 
            Transactions t ON a.AccountID = t.AccountID
        WHERE 
            a.Balance > 10000
            AND t.TransactionDate BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE
    );
