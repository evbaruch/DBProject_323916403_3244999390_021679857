CREATE OR REPLACE FUNCTION get_customer_total_balance(p_customer_id IN NUMBER) 
RETURN NUMBER 
IS
    -- Variable to store the total balance of all accounts for the given customer
    v_total_balance NUMBER := 0;
    
    -- Variable to store the positive interest rate for VIP accounts
    v_positive_interest NUMBER := 0;

    -- Explicit cursor to fetch account details for the given customer
    CURSOR c_accounts IS
        SELECT a.AccountID, a.Balance
        FROM Account a
        JOIN Relationship r ON a.AccountID = r.AccountID
        WHERE r.CustomerID = p_customer_id;
    
    -- Record variable to hold a row fetched by the cursor
    v_account_record c_accounts%ROWTYPE;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Fetching accounts for customer ID: ' || p_customer_id);
    
    -- Open the cursor to begin fetching rows
    OPEN c_accounts;
    
    -- Loop to fetch each account's balance and update the total balance
    LOOP
        FETCH c_accounts INTO v_account_record;
        EXIT WHEN c_accounts%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Processing account ID: ' || v_account_record.AccountID || ', Balance: ' || v_account_record.Balance);

        -- Add the current account's balance to the total balance
        v_total_balance := v_total_balance + v_account_record.Balance;
        DBMS_OUTPUT.PUT_LINE('Updated total balance: ' || v_total_balance);

        -- Apply interest for VIP accounts
        BEGIN
            -- Fetch the positive interest rate for the current account if it is a VIP account
            SELECT PositiveInterest 
            INTO v_positive_interest 
            FROM Vip 
            WHERE AccountID = v_account_record.AccountID;

            DBMS_OUTPUT.PUT_LINE('Applying interest for VIP account ID: ' || v_account_record.AccountID || ', Interest rate: ' || v_positive_interest);

            -- Apply the interest rate to the total balance
            v_total_balance := v_total_balance * (1 + v_positive_interest);
            DBMS_OUTPUT.PUT_LINE('Total balance after applying interest: ' || v_total_balance);
        EXCEPTION
            -- Handle the case where the current account is not a VIP account
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Account ID ' || v_account_record.AccountID || ' is not a VIP account.');
                NULL; -- No interest for non-VIP accounts
        END;
    END LOOP;
    
    -- Close the cursor after fetching all rows
    CLOSE c_accounts;

    DBMS_OUTPUT.PUT_LINE('Final total balance for customer ID ' || p_customer_id || ': ' || v_total_balance);
    DBMS_OUTPUT.NEW_LINE;

    -- Return the total balance
    RETURN v_total_balance;
    
EXCEPTION
    -- Handle any other exceptions that occur
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in get_customer_total_balance: ' || SQLERRM);
        RETURN NULL;
END get_customer_total_balance;
/
