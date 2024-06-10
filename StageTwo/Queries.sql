-----------------| selects


SELECT c.FirstName, c.LastName, a.Balance, b.BranchName, b.BranchAddress
   FROM Customer c JOIN Relationship r ON c.CustomerID = r.CustomerID JOIN Account a ON r.AccountID = a.AccountID JOIN Branch b ON a.BranchID = b.BranchID
   WHERE a.Balance > (
         SELECT PERCENTILE_DISC(0.9) WITHIN GROUP (ORDER BY a2.Balance) -- Calculate the 90th percentile balance for each branch
         FROM Account a2
         WHERE a2.BranchID = a.BranchID
       )
   ORDER BY
     a.Balance DESC;
     
     
     
SELECT  c.FirstName, c.LastName, t.TransactionDate, t.TransactionType, t.Amount
   FROM Transactions t JOIN Account a ON t.AccountID = a.AccountID JOIN Relationship r ON a.AccountID = r.AccountID JOIN Customer c ON r.CustomerID = c.CustomerID
   WHERE t.TransactionDate BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE
   ORDER BY c.LastName, c.FirstName, t.TransactionDate DESC;
   
   
   
   
SELECT b.BranchName, b.BranchAddress, SUM(a.Balance) AS TotalBalance, COUNT(a.AccountID) AS AccountCount
   FROM Branch b JOIN  Account a ON b.BranchID = a.BranchID
   WHERE a.DateOpened BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE
   GROUP BY b.BranchName, b.BranchAddress
   ORDER BY TotalBalance DESC;
   
   
   
SELECT c.FirstName, c.LastName, a.Balance, v.PositiveInterest
   FROM Customer c JOIN Relationship r ON c.CustomerID = r.CustomerID JOIN Account a ON r.AccountID = a.AccountID JOIN Vip v ON a.AccountID = v.AccountID
   WHERE NOT EXISTS (
       SELECT 1
       FROM Transactions t
       WHERE t.AccountID = a.AccountID
   )
   ORDER BY c.LastName, c.FirstName;
   
   
   
-----------------| delete


DELETE FROM BlackList
   WHERE NEGETIVEINTEREST < (
       SELECT PERCENTILE_DISC(0.25) WITHIN GROUP (ORDER BY NEGETIVEINTEREST) -- Calculate the 25th percentile negative interest
       FROM
       BlackList
       );
       
       
       
DELETE FROM DirectDebit
   WHERE AccountID IN (
       SELECT AccountID
       FROM Account
       WHERE AccountStatus = 'closed'
       );
       
       
       
-----------------| update


UPDATE Customer
SET ContactNumber = '0000000000'
WHERE CustomerID IN (
                     SELECT c.CustomerID
                     FROM Customer c JOIN Relationship r ON c.CustomerID = r.CustomerID JOIN Account a ON r.AccountID = a.AccountID
                     WHERE a.DateOpened < ADD_MONTHS(SYSDATE, -240)
                    );
                         
                         
                         
                         
                         
                         
UPDATE Vip
SET PositiveInterest = PositiveInterest + 0.5
WHERE AccountID IN (
                    SELECT a.AccountID
                    FROM Account a JOIN Transactions t ON a.AccountID = t.AccountID
                    WHERE a.Balance > 10000 AND t.TransactionDate BETWEEN ADD_MONTHS(SYSDATE, -24) AND SYSDATE
                    );

