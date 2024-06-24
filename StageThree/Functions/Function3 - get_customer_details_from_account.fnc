CREATE OR REPLACE FUNCTION get_customer_details_from_account(p_account_id IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_customer_details SYS_REFCURSOR;
    v_customer_count NUMBER;
    v_is_vip BOOLEAN := FALSE;
    
    -- Define a record type for customer details
    TYPE r_customer IS RECORD (
        CustomerID NUMBER,
        FirstName VARCHAR2(100),
        LastName VARCHAR2(100),
        LinkedAccountCount NUMBER
    );
    v_customer r_customer;
BEGIN
    -- Check if the account is a VIP account
    BEGIN
        SELECT 1 INTO v_customer_count
        FROM Vip
        WHERE AccountID = p_account_id;
        v_is_vip := TRUE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            v_is_vip := FALSE;
    END;
    
    -- Get customer details
    OPEN v_customer_details FOR
        SELECT r.CustomerID, c.FirstName, c.LastName, (
            SELECT COUNT(*) 
            FROM Relationship 
            WHERE CustomerID = r.CustomerID
        ) AS linked_account_count
        FROM Relationship r
        JOIN Customer c ON r.CustomerID = c.CustomerID
        WHERE r.AccountID = p_account_id
        ORDER BY c.DateOfBirth ASC
        FETCH FIRST 1 ROWS ONLY;
    
    -- Fetch and process customer details
    FETCH v_customer_details INTO v_customer;
    
    -- Log customer details
    DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer.CustomerID);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_customer.FirstName || ' ' || v_customer.LastName);
    DBMS_OUTPUT.PUT_LINE('Linked Accounts: ' || v_customer.LinkedAccountCount);
    
    IF v_is_vip THEN
        DBMS_OUTPUT.PUT_LINE('This is a VIP account');
    ELSE
        DBMS_OUTPUT.PUT_LINE('This is a regular account');
    END IF;
    
    -- Reopen the cursor for returning
    OPEN v_customer_details FOR
        SELECT r.CustomerID, c.FirstName, c.LastName, (
            SELECT COUNT(*) 
            FROM Relationship 
            WHERE CustomerID = r.CustomerID
        ) AS linked_account_count
        FROM Relationship r
        JOIN Customer c ON r.CustomerID = c.CustomerID
        WHERE r.AccountID = p_account_id
        ORDER BY c.DateOfBirth ASC
        FETCH FIRST 1 ROWS ONLY;
    
    RETURN v_customer_details;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in get_customer_details_from_account: ' || SQLERRM);
        RETURN NULL;
END get_customer_details_from_account;
/
