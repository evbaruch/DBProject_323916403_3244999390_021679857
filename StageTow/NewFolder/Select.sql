

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
            AVG(a2.Balance)
        FROM 
            Account a2
        WHERE 
            a2.BranchID = a.BranchID
    )
ORDER BY 
    a.Balance DESC;