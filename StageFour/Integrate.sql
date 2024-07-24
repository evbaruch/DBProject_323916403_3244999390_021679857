-- Disable constraints
ALTER TABLE EMPLOYEE DISABLE CONSTRAINT FK_EMPLOYEE_DEPARTMENT;
ALTER TABLE EMPLOYEE DISABLE CONSTRAINT FK_EMPLOYEE_POSITION;

-- Add branchid column to EMPLOYEE table
ALTER TABLE EMPLOYEE
ADD (branchid NUMBER(20));

-- Add new foreign key constraint
ALTER TABLE EMPLOYEE
ADD CONSTRAINT FK_EMPLOYEE_BRANCH FOREIGN KEY (branchid)
REFERENCES Branch (BranchID)
ON DELETE CASCADE;

-- Enable constraints again
ALTER TABLE EMPLOYEE ENABLE CONSTRAINT FK_EMPLOYEE_DEPARTMENT;
ALTER TABLE EMPLOYEE ENABLE CONSTRAINT FK_EMPLOYEE_POSITION;


-- Step 3: Populate branchid column with random values from Branch table
DECLARE
    CURSOR c_employee IS
        SELECT employeeid FROM Employee;
    v_branchid Branch.branchid%TYPE;
BEGIN
    FOR r_employee IN c_employee LOOP
        SELECT branchid
        INTO v_branchid
        FROM (
            SELECT branchid
            FROM Branch
            ORDER BY DBMS_RANDOM.VALUE
        )
        WHERE ROWNUM = 1;

        UPDATE Employee
        SET branchid = v_branchid
        WHERE employeeid = r_employee.employeeid;
    END LOOP;
END;
/

