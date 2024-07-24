
-- Step 3: Populate branchid column with random values from Branch table
UPDATE EMPLOYEE
SET branchid = (
    SELECT BranchID
    FROM (
        SELECT BranchID
        FROM Branch
        ORDER BY DBMS_RANDOM.VALUE
    )
    WHERE ROWNUM = 1
);


select * From Employee
