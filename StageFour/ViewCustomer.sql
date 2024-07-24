-- Create or Replace View: vw_CustomerAccountDetails
-- 
-- Purpose:
-- This view consolidates customer details along with their account and branch information. 
-- It provides a comprehensive dataset combining customer information, account details, and branch information, which can be used for various analytical and reporting purposes.
--
-- Columns:
--   - CustomerID: Unique identifier for each customer from the Customer table.
--   - FirstName: Customer's first name from the Customer table.
--   - LastName: Customer's last name from the Customer table.
--   - AccountID: Unique identifier for each account from the Account table.
--   - Balance: Current balance of the account from the Account table.
--   - AccountStatus: Status of the account (e.g., active, inactive) from the Account table.
--   - BranchName: Name of the branch where the account is held from the Branch table.
--   - BranchAddress: Address of the branch from the Branch table.
--
-- Joins:
--   - Customer (c) is joined with Rel5 (r) on CustomerID to link customers with their accounts.
--   - Account (a) is joined with Rel5 (r) on AccountID to link accounts with their details.
--   - Account (a) is joined with Branch (b) on BranchID to link accounts with their branch information.
--
-- The view provides a unified view of customer accounts and their associated branch details.
CREATE OR REPLACE VIEW vw_CustomerAccountDetails AS
SELECT
    c.CustomerID,
    c.FirstName,
    c.LastName,
    a.AccountID,
    a.Balance,
    a.AccountStatus,
    b.BranchName,
    b.BranchAddress
FROM
    Customer c
JOIN
    Rel5 r ON c.CustomerID = r.CustomerID
JOIN
    Account a ON r.AccountID = a.AccountID
JOIN
    Branch b ON a.BranchID = b.BranchID;
/

-- Query: Count the number of customers for each branch
-- 
-- Purpose:
-- This query calculates the number of customers associated with each branch. 
-- It groups customers by their branch and counts how many customers are linked to each branch.
--
-- Columns:
--   - BranchName: The name of the branch from the vw_CustomerAccountDetails view.
--   - NumberOfCustomers: The total number of customers associated with each branch.
--
-- Grouping:
--   - Results are grouped by BranchName to get the count of customers per branch.
--
-- Ordering:
--   - Results are ordered by NumberOfCustomers in ascending order to show branches with fewer customers first.
SELECT 
    BranchName, 
    COUNT(CustomerID) AS NumberOfCustomers
FROM 
    vw_CustomerAccountDetails
GROUP BY 
    BranchName
ORDER BY 
    NumberOfCustomers;
/

-- Query: Count the number of customers for each account status
-- 
-- Purpose:
-- This query calculates the number of customers for each account status. 
-- It helps in understanding the distribution of account statuses across customers.
--
-- Columns:
--   - AccountStatus: The status of the account from the vw_CustomerAccountDetails view (e.g., active, inactive).
--   - NumberOfCustomers: The total number of customers with each account status.
--
-- Grouping:
--   - Results are grouped by AccountStatus to get the count of customers for each status.
--
-- Ordering:
--   - Results are ordered by NumberOfCustomers in ascending order to display statuses with fewer customers first.
SELECT 
    AccountStatus, 
    COUNT(CustomerID) AS NumberOfCustomers
FROM 
    vw_CustomerAccountDetails
GROUP BY 
    AccountStatus
ORDER BY 
    NumberOfCustomers;
/
