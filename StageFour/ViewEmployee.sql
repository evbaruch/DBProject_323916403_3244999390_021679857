-- Create or Replace View: vw_EmployeeDepartment
-- 
-- Purpose:
-- This view consolidates employee details along with their department, position, and branch information. 
-- It provides a unified dataset that includes employee personal information, their department, position, and the branch they are associated with.
--
-- Columns:
--   - EmployeeID: Unique identifier for each employee from the Employee table.
--   - First_Name: Employee's first name from the Employee table.
--   - Last_Name: Employee's last name from the Employee table.
--   - departmentName: Name of the department from the department table.
--   - PositionsName: Name of the employee's position from the Positions table.
--   - salary: Employee's salary from the Employee table.
--   - BranchName: Name of the branch where the employee works from the Branch table.
--
-- Joins:
--   - Employee (e) is joined with department (d) on DepartmentID to get department details.
--   - Employee (e) is joined with Positions (p) on PositionID to get position details.
--   - Employee (e) is joined with Branch (b) on branchid to get branch details.
--
-- The view provides comprehensive information about employees, including their department, position, and branch.
CREATE OR REPLACE VIEW vw_EmployeeDepartment AS
SELECT
    e.EmployeeID,
    e.First_Name,
    e.Last_Name,
    d.departmentName,
    p.PositionsName,
    e.salary,
    b.BranchName  -- Added BranchName to the view
FROM
    Employee e
JOIN
    department d ON e.DepartmentID = d.departmentID
JOIN
    Positions p ON e.PositionID = p.PositionsID
JOIN
    Branch b ON e.branchid = b.BranchID;  -- Join with Branch table to include branch information
/

-- Query: Count the number of employees in each department
-- 
-- Purpose:
-- This query calculates the number of employees within each department. 
-- It groups employees by their department and counts how many employees are in each department.
--
-- Columns:
--   - departmentName: The name of the department from the vw_EmployeeDepartment view.
--   - NumberOfEmployees: The total number of employees in each department.
--
-- Grouping:
--   - Results are grouped by departmentName to get the count of employees per department.
--
-- Ordering:
--   - Results are ordered by NumberOfEmployees in descending order to display departments with the most employees first.
SELECT 
    departmentName, 
    COUNT(EmployeeID) AS NumberOfEmployees
FROM 
    vw_EmployeeDepartment
GROUP BY 
    departmentName
ORDER BY 
    NumberOfEmployees DESC;
    

-- Query: Count the number of employees in each position
-- 
-- Purpose:
-- This query calculates the number of employees in each position. 
-- It groups employees by their position and counts how many employees hold each position.
--
-- Columns:
--   - PositionsName: The name of the position from the vw_EmployeeDepartment view.
--   - NumberOfEmployees: The total number of employees in each position.
--
-- Grouping:
--   - Results are grouped by PositionsName to get the count of employees per position.
--
-- Ordering:
--   - Results are ordered by NumberOfEmployees in descending order to show positions with the most employees first.
SELECT 
    PositionsName, 
    COUNT(EmployeeID) AS NumberOfEmployees
FROM 
    vw_EmployeeDepartment
GROUP BY 
    PositionsName
ORDER BY 
    NumberOfEmployees DESC;
    
-- Query: Count the number of employees in each branch
-- 
-- Purpose:
-- This query calculates the number of employees in each branch. 
-- It groups employees by their branch and counts how many employees are associated with each branch.
--
-- Columns:
--   - BranchName: The name of the branch from the vw_EmployeeDepartment view.
--   - NumberOfEmployees: The total number of employees in each branch.
--
-- Grouping:
--   - Results are grouped by BranchName to get the count of employees per branch.
--
-- Ordering:
--   - Results are ordered by NumberOfEmployees in descending order to display branches with the most employees first.
SELECT 
    BranchName, 
    COUNT(EmployeeID) AS NumberOfEmployees
FROM 
    vw_EmployeeDepartment
GROUP BY 
    BranchName
ORDER BY 
    NumberOfEmployees DESC;
/
