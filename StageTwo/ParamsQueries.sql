SELECT v.AccountID, c.FirstName || ' ' || c.LastName AS CustomerName, v.PositiveInterest,
    (SELECT COUNT(*)
    FROM Transactions t
    WHERE t.AccountID = v.AccountID
    AND t.Amount > &minTransactionAmount
    AND t.TransactionDate BETWEEN TO_DATE('&<name="Start Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))">', 'YYYY-MM-DD') AND TO_DATE('&<name="End Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))">', 'YYYY-MM-DD')) AS TransactionCount
    FROM Vip v
    JOIN Relationship r ON v.AccountID = r.AccountID
    JOIN Customer c ON r.CustomerID = c.CustomerID
    WHERE EXISTS (
                  SELECT 1
                  FROM Transactions t
                  WHERE t.AccountID = v.AccountID
                  AND t.Amount > &minTransactionAmount
                  AND t.TransactionDate BETWEEN TO_DATE('&<name="Start Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))">', 'YYYY-MM-DD') AND TO_DATE('&<name="End Date" type="date" list="SELECT TO_CHAR(TransactionDate, 'YYYY-MM-DD') FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate) WHERE ROWNUM <= (SELECT MAX(ROWNUM) FROM (SELECT TransactionDate FROM Transactions ORDER BY TransactionDate))">', 'YYYY-MM-DD')
   );
   
   

SELECT b.BranchName, b.BranchAddress,
    (SELECT COUNT(*)
     FROM Account a
     WHERE a.BranchID = b.BranchID
       AND a.AccountStatus != 'closed') AS ActiveAccounts,
    (SELECT SUM(a.Balance)
     FROM Account a
    WHERE a.BranchID = b.BranchID AND a.AccountStatus != 'closed') AS TotalBalance
    FROM Branch b
    WHERE b.BranchAddress IN (&<name="Cities" type="string" list="select BranchAddress from Branch order by BranchAddress" multiselect="yes">);
    
    
    
SELECT
    bl.AccountID,
    bl.NegetiveInterest,
    bl.MinimumMinus,
    (
        SELECT a.Balance
        FROM Account a
        WHERE a.AccountID = bl.AccountID
          AND a.Balance < -&<name="Negative Balance Threshold" type="float">
    ) AS NegativeBalance
FROM
    BlackList bl
WHERE
    EXISTS (
        SELECT 1
        FROM Account a
        WHERE a.AccountID = bl.AccountID
          AND a.Balance < -&<name="Negative Balance Threshold" type="float">
    );

SELECT
    bl.AccountID,
    c.FirstName || ' ' || c.LastName AS CustomerName,
    bl.NegetiveInterest,
    bl.MinimumMinus,
    (
        SELECT a.Balance
        FROM Account a
        WHERE a.AccountID = bl.AccountID
        AND a.Balance < -&<name="Negative Balance Threshold" type="float">
    ) AS NegativeBalance
FROM
    BlackList bl
JOIN
    Relationship r ON bl.AccountID = r.AccountID -- Assuming BlackList and Relationship are linked through AccountID
JOIN
    Customer c ON r.CustomerID = c.CustomerID
WHERE
    EXISTS (
        SELECT 1
        FROM Account a
        WHERE a.AccountID = bl.AccountID
        AND a.Balance < -&<name="Negative Balance Threshold" type="float">
    );
