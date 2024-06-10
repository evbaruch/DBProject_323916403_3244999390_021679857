/*
Documentation for SQL Query

Purpose:
---------
To generate a list of customers whose account balances exceed the average balance at their respective
branches. This information is useful for identifying high-value customers for personalized services or 
financial advice, thereby enhancing customer relationships and maximizing profitability.

Context and Story:
-------------------
As a data analyst at a major bank, you're tasked with providing insights that can help the bank's 
relationship managers identify and target high-value customers. The bank has branches across various 
regions, and understanding how individual account balances compare to the average balance at each 
branch is critical. This report will assist in pinpointing customers whose financial engagements 
with the bank surpass the norm, enabling targeted efforts to cater to their needs effectively.

Explanation:
-------------
This query is designed to extract customer details along with their account balances for accounts 
that exceed the average balance of their respective branches. Here’s how it works:

1. SELECT Clause:
   - c.FirstName, c.LastName: Retrieves the first and last names of customers.
   - a.Balance: Retrieves the balance of each customer's account.
   - b.BranchName, b.BranchAddress: Retrieves the name and address of the branch associated with the account.

2. FROM Clause:
   - The query starts with the Customer table (c), which holds customer information.
   - JOIN Rel5 r ON c.CustomerID = r.CustomerID: Joins the Rel5 table to link each customer with their accounts using the CustomerID.
   - JOIN Account a ON r.AccountID = a.AccountID: Joins the Account table to get the balance for each account.
   - JOIN Branch b ON a.BranchID = b.BranchID: Joins the Branch table to associate each account with its branch.

3. WHERE Clause:
   - a.Balance > (SELECT AVG(a2.Balance) FROM Account a2 WHERE a2.BranchID = a.BranchID): This subquery 
   calculates the average balance (AVG(a2.Balance)) for each branch and compares it to the balance of 
   the current account (a.Balance). Only accounts with balances greater than this average are included 
   in the results.

4. ORDER BY Clause:
   - ORDER BY a.Balance DESC: Sorts the results by account balance in descending order, so the highest balances appear first.

By using this query, the bank can quickly identify customers with significant account balances relative 
to their branch's average, allowing for more targeted customer service and strategic planning.
*/

SELECT c.FirstName, c.LastName, a.Balance, b.BranchName, b.BranchAddress
FROM  
Customer c JOIN  Rel5 r ON c.CustomerID = r.CustomerID JOIN  Account a ON r.AccountID = a.AccountID JOIN Branch b ON a.BranchID = b.BranchID
WHERE  a.Balance > (
        SELECT AVG(a2.Balance)
        FROM Account a2
        WHERE a2.BranchID = a.BranchID 
        )
ORDER BY 
    a.Balance DESC;
