/*
Documentation for SQL Query

Purpose:
---------
To generate a report of total balances and the number of accounts opened at each branch over the past 24 months. This report is useful for evaluating branch performance in terms of account acquisition and balance accumulation.

Context and Story:
-------------------
In your role as a data analyst at a bank, you need to assess the performance of various branches over the last two years. The bank's management requires insights into which branches have been most successful in opening new accounts and accumulating balances. This report helps in understanding branch-level effectiveness in attracting and retaining customers, which is crucial for strategic planning and resource allocation.

Explanation:
-------------
This query retrieves the total balance and the count of accounts opened at each branch within the past 24 months. Here’s how it works:

1. SELECT Clause:
   - `b.BranchName`: Retrieves the name of each branch.
   - `b.BranchAddress`: Retrieves the address of each branch.
   - `SUM(a.Balance) AS TotalBalance`: Calculates the total balance of all accounts opened at each branch.
   - `COUNT(a.AccountID) AS AccountCount`: Counts the number of accounts opened at each branch.

2. FROM Clause:
   - The query starts with the `Branch` table (`b`), which holds information about each branch.
   - `JOIN Account a ON b.BranchID = a.BranchID`: Joins the `Account` table to link accounts with their respective branches.

3. WHERE Clause:
   - `a.DateOpened BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE`: Filters accounts to include only those that were opened within the last 24 months.
     - `ADD_MONTHS(SYSDATE, -24)`: Computes the date 24 months ago from the current date (`SYSDATE`).
     - `SYSDATE`: Represents the current date and time.

4. GROUP BY Clause:
   - `GROUP BY b.BranchName, b.BranchAddress`: Groups the results by branch name and address to calculate the total balance and account count for each branch.

5. ORDER BY Clause:
   - `ORDER BY TotalBalance DESC`: Sorts the branches by their total balance in descending order, so branches with higher total balances appear first.

By using this query, the bank can evaluate branch performance over the past two years in terms of new account openings and the total balances accumulated, which aids in performance management and strategic decision-making.
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
    a.DateOpened BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE
GROUP BY 
    b.BranchName, b.BranchAddress
ORDER BY 
    TotalBalance DESC;
