/*
Documentation for SQL Query

Purpose:
---------
To generate a report of customers whose account balances exceed the 90th percentile balance for their respective branches. This report helps identify high-balance customers relative to branch-specific benchmarks.

Context and Story:
-------------------
As a data analyst at a bank, you're tasked with identifying customers with high account balances relative to their branch peers. Management is interested in understanding which customers hold significantly higher balances compared to others within the same branch. This report facilitates targeted marketing efforts, personalized services, and better understanding of customer segmentation for strategic decision-making.

Explanation:
-------------
This query retrieves details of customers whose account balances exceed the 90th percentile balance for their respective branches. Here’s how it works:

1. SELECT Clause:
   - `c.FirstName, c.LastName`: Retrieves the first and last names of the customers.
   - `a.Balance`: Retrieves the balance of each customer's account.
   - `b.BranchName, b.BranchAddress`: Retrieves the name and address of the branch associated with the account.

2. FROM Clause:
   - The query starts with the `Customer` table (`c`), which holds customer information.
   - `JOIN Rel5 r ON c.CustomerID = r.CustomerID`: Joins the `Rel5` table to link customers to their accounts via `CustomerID`.
   - `JOIN Account a ON r.AccountID = a.AccountID`: Joins the `Account` table to get account details, including balance.
   - `JOIN Branch b ON a.BranchID = b.BranchID`: Joins the `Branch` table to associate each account with its branch.

3. WHERE Clause:
   - `a.Balance > (SELECT PERCENTILE_DISC(0.9) WITHIN GROUP (ORDER BY a2.Balance) FROM Account a2 WHERE a2.BranchID = a.BranchID)`: Compares the balance of each account with the 90th percentile balance of accounts within the same branch.
     - `PERCENTILE_DISC(0.9) WITHIN GROUP (ORDER BY a2.Balance)`: Calculates the 90th percentile balance for each branch using the `Account` table.
     - `a2.BranchID = a.BranchID`: Ensures that only accounts within the same branch are considered for calculating the percentile.

4. ORDER BY Clause:
   - `ORDER BY a.Balance DESC`: Sorts the results by account balance in descending order, so the highest balances appear first.

By using this query, the bank can identify customers with significantly higher balances compared to their branch peers, allowing for targeted marketing strategies and personalized services to enhance customer satisfaction and loyalty.
*/

SELECT 
    c.FirstName,
    c.LastName,
    a.Balance,
    b.BranchName,
    b.BranchAddress
FROM 
    Customer c
JOIN 
    Rel5 r ON c.CustomerID = r.CustomerID
JOIN 
    Account a ON r.AccountID = a.AccountID
JOIN 
    Branch b ON a.BranchID = b.BranchID
WHERE 
    a.Balance > (
        SELECT 
            PERCENTILE_DISC(0.9) WITHIN GROUP (ORDER BY a2.Balance) -- Calculate the 90th percentile balance for each branch
        FROM 
            Account a2
        WHERE 
            a2.BranchID = a.BranchID
    )
ORDER BY 
    a.Balance DESC;
