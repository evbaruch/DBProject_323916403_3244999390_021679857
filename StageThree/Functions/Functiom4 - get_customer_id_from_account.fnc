CREATE OR REPLACE FUNCTION get_customer_id_from_account(p_account_id IN NUMBER)
RETURN NUMBER
IS
    v_customer_id Customer.CustomerID%TYPE;
    v_customer_firstname Customer.FirstName%TYPE;
    v_customer_lastname Customer.LastName%TYPE;
    v_linked_account_count NUMBER;
BEGIN
    -- Initialize variables
    v_customer_id := NULL;
    v_customer_firstname := NULL;
    v_customer_lastname := NULL;
    v_linked_account_count := 0;

    -- Cursor declaration to fetch the oldest customer linked to the account
    FOR c_customer IN (
        SELECT r.CustomerID, c.FirstName, c.LastName, (
            SELECT COUNT(*) 
            FROM Relationship 
            WHERE CustomerID = r.CustomerID
        ) AS linked_account_count
        FROM Relationship r
        JOIN Customer c ON r.CustomerID = c.CustomerID
        WHERE r.AccountID = p_account_id
        ORDER BY c.DateOfBirth ASC
    )
    LOOP
        -- Assign values fetched by cursor to variables
        v_customer_id := c_customer.CustomerID;
        v_customer_firstname := c_customer.FirstName;
        v_customer_lastname := c_customer.LastName;
        v_linked_account_count := c_customer.linked_account_count;

        -- Output the retrieved information
        DBMS_OUTPUT.PUT_LINE('Oldest Customer ID linked to Account ' || p_account_id || ': ' || v_customer_id);
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_customer_firstname || ' ' || v_customer_lastname);
        DBMS_OUTPUT.PUT_LINE('Number of other accounts linked to this customer: ' || (v_linked_account_count - 1));

        -- Exit loop after processing the first row (oldest customer)
        EXIT;
    END LOOP;

    -- Check if any rows were fetched
    IF v_customer_id IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('No customer found linked to Account ' || p_account_id);
    END IF;

    RETURN v_customer_id; -- Return the customer ID
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No customer found linked to Account ' || p_account_id);
        RETURN NULL; -- Handle case where no customer is found for the account
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in get_customer_id_from_account: ' || SQLERRM);
        RETURN NULL; -- Handle other exceptions
END get_customer_id_from_account;
/
