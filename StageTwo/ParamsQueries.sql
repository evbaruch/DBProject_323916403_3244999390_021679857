SELECT v.AccountID, c.FirstName || ' ' || c.LastName AS CustomerName, v.PositiveInterest,
    (SELECT COUNT(*)
    FROM Transactions t
    WHERE t.AccountID = v.AccountID
    AND t.Amount > &<name = "min Transaction Amount" hint = "Specify the minimum transaction amount">
    AND t.TransactionDate BETWEEN TO_DATE('&<name="Start Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))" hint = "Select the start date for the date range">', 'YYYY-MM-DD') AND TO_DATE('&<name="End Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))"  hint = "Select the end date for the date range">', 'YYYY-MM-DD')) AS TransactionCount
    FROM Vip v
    JOIN Relationship r ON v.AccountID = r.AccountID
    JOIN Customer c ON r.CustomerID = c.CustomerID
    WHERE EXISTS (
                  SELECT 1
                  FROM Transactions t
                  WHERE t.AccountID = v.AccountID
                  AND t.Amount > &<name = "min Transaction Amount" hint = "Specify the minimum transaction amount">
                  AND t.TransactionDate BETWEEN TO_DATE('&<name="Start Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))" hint = "Select the start date for the date range">', 'YYYY-MM-DD') AND TO_DATE('&<name="End Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))"  hint = "Select the end date for the date range">', 'YYYY-MM-DD')
                  );
   
   
   
   
   
SELECT /*+ LEADING(b) USE_NL(b a) */
    b.BranchName, b.BranchAddress,
    (SELECT /*+ PARALLEL(a, 4) */
     COUNT(*)
     FROM Account a
     WHERE a.BranchID = b.BranchID
       AND a.AccountStatus != 'closed') AS ActiveAccounts,
    (SELECT /*+ PARALLEL(a, 4) */
     SUM(a.Balance)
     FROM Account a
     WHERE a.BranchID = b.BranchID
       AND a.AccountStatus != 'closed') AS TotalBalance
FROM Branch b
WHERE b.BranchAddress IN (&<name="Cities" type="string" list="SELECT BranchAddress FROM Branch ORDER BY BranchAddress" multiselect="yes" hint="Select the cities">);











SELECT c.CustomerID, c.FirstName, c.LastName,
    (SELECT /*+ PARALLEL(a, 4) */
     SUM(a.Balance)
     FROM Account a
     WHERE EXISTS (SELECT 1
                   FROM Relationship r
                   WHERE r.CustomerID = c.CustomerID
                     AND r.AccountID = a.AccountID)) AS CumulativeBalance,
    (SELECT /*+ PARALLEL(a, 4) */
     COUNT(*)
     FROM Account a
     WHERE EXISTS (SELECT 1
                   FROM Relationship r
                   WHERE r.CustomerID = c.CustomerID
                     AND r.AccountID = a.AccountID)) AS AccountCount
FROM Customer c
WHERE (
        SELECT /*+ PARALLEL(a, 4) */
        SUM(a.Balance)
        FROM Account a
        WHERE EXISTS (SELECT 1
                      FROM Relationship r
                      WHERE r.CustomerID = c.CustomerID
                        AND r.AccountID = a.AccountID)
      ) > &<name="Cumulative Balance Threshold" type="float" hint="Enter the cumulative balance threshold">;











SELECT
    bl.AccountID,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    bl.NegetiveInterest,
    bl.MinimumMinus,
    (
        SELECT /*+ PARALLEL(a, 4) */
        a.Balance
        FROM Account a
        WHERE a.AccountID = bl.AccountID
        AND a.Balance < -&<name="Negative Balance Threshold" type="float" hint="Enter the negative balance threshold">
    ) AS NegativeBalance
FROM
    BlackList bl
JOIN
    Relationship r ON bl.AccountID = r.AccountID
JOIN
    Customer c ON r.CustomerID = c.CustomerID
WHERE
    EXISTS (
        SELECT /*+ PARALLEL(a, 4) */
        1
        FROM Account a
        WHERE a.AccountID = bl.AccountID
        AND a.Balance < -&<name="Negative Balance Threshold" type="float" hint="Enter the negative balance threshold">
    );
