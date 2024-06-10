/*
Documentation for SQL Query

Purpose:
---------
To generate a report of the total balance and the number of accounts opened at each branch for the current year. This information is useful for evaluating branch performance in terms of attracting new accounts and accumulating balances.

Context and Story:
-------------------
As a data analyst at a bank, you need to provide insights into the performance of different branches throughout the year. Management is interested in understanding which branches have been most effective in opening new accounts and accumulating balances. This report will help in assessing the success of various branches in the current year, allowing for targeted strategic decisions and resource allocation.

Explanation:
-------------
This query retrieves the total balance and the count of accounts opened at each branch for the current year. Here’s how it works:

1. SELECT Clause:
   - b.BranchName: Retrieves the name of each branch.
   - b.BranchAddress: Retrieves the address of each branch.
   - SUM(a.Balance) AS TotalBalance: Calculates the total balance of all accounts at each branch.
   - COUNT(a.AccountID) AS AccountCount: Counts the number of accounts opened at each branch.

2. FROM Clause:
   - The query starts with the Branch table (b), which holds branch details.
   - JOIN Account a ON b.BranchID = a.BranchID: Joins the Account table to associate each account with its branch.

3. WHERE Clause:
   - EXTRACT(YEAR FROM a.DateOpened) = EXTRACT(YEAR FROM SYSDATE): Filters the accounts to include only those that were opened in the current year.
     - `EXTRACT(YEAR FROM a.DateOpened)`: Extracts the year part from the `DateOpened` column in the `Account` table.
     - `EXTRACT(YEAR FROM SYSDATE)`: Extracts the current year from the system date (`SYSDATE`).

4. GROUP BY Clause:
   - GROUP BY b.BranchName, b.BranchAddress: Groups the results by branch name and address to calculate the total balance and account count for each branch.

5. ORDER BY Clause:
   - ORDER BY TotalBalance DESC: Sorts the branches by their total balance in descending order, so branches with higher total balances appear first.

By using this query, the bank can evaluate the performance of its branches in terms of new account openings and total balances accumulated over the current year, facilitating better performance management and decision-making.
*/

SELECT 
    b.BranchName,
    b.BranchAddress,
    SUM(a.Balance) AS TotalBalance,
    COUNT(a.AccountID) AS AccountCount
FROM 
    Branch b
JOIN 
    Account a ON b.BranchID = a.BranchID
WHERE 
    EXTRACT(YEAR FROM a.DateOpened) = EXTRACT(YEAR FROM SYSDATE)
GROUP BY 
    b.BranchName, b.BranchAddress
ORDER BY 
    TotalBalance DESC;
