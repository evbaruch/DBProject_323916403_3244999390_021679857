CREATE OR REPLACE PROCEDURE main_transfer_and_balance (
    p_transfer_amount NUMBER,
    p_from_account_id NUMBER,
    p_to_account_id NUMBER
)
IS
    v_total_balance NUMBER;
    v_from_balance NUMBER;
    v_to_balance NUMBER;
    v_customer_id Customer.CustomerID%TYPE;
    v_customer_firstname Customer.FirstName%TYPE;
    v_customer_lastname Customer.LastName%TYPE;
    v_linked_account_count NUMBER;
    v_customer_details SYS_REFCURSOR;
    CURSOR c_check_balances IS
        SELECT AccountID, Balance
        FROM Account
        WHERE AccountID IN (p_from_account_id, p_to_account_id);
    v_account_record c_check_balances%ROWTYPE;
    v_transfer_successful BOOLEAN := FALSE;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Starting main_transfer_and_balance procedure...');
    -- Step 1: Check balances of both accounts
    OPEN c_check_balances;
    LOOP
        FETCH c_check_balances INTO v_account_record;
        EXIT WHEN c_check_balances%NOTFOUND;
        IF v_account_record.AccountID = p_from_account_id THEN
            v_from_balance := v_account_record.Balance;
        ELSIF v_account_record.AccountID = p_to_account_id THEN
            v_to_balance := v_account_record.Balance;
        END IF;
    END LOOP;
    CLOSE c_check_balances;
    
    DBMS_OUTPUT.PUT_LINE('Initial balances:');
    DBMS_OUTPUT.PUT_LINE('From account (ID ' || p_from_account_id || '): $' || v_from_balance);
    DBMS_OUTPUT.PUT_LINE('To account (ID ' || p_to_account_id || '): $' || v_to_balance);
    DBMS_OUTPUT.NEW_LINE;
    
    -- Step 2: Check if the transfer is valid and proceed
    IF v_from_balance >= p_transfer_amount THEN
        DBMS_OUTPUT.PUT_LINE('Proceeding with the transfer of $' || p_transfer_amount);
        BEGIN
            transfer_money(p_from_account_id, p_to_account_id, p_transfer_amount);
            v_transfer_successful := TRUE;
        EXCEPTION
            WHEN OTHERS THEN
                v_transfer_successful := FALSE;
                DBMS_OUTPUT.PUT_LINE('Transfer failed: ' || SQLERRM);
        END;
        
        IF v_transfer_successful THEN
            -- Recalculate balances
            SELECT Balance INTO v_from_balance FROM Account WHERE AccountID = p_from_account_id;
            SELECT Balance INTO v_to_balance FROM Account WHERE AccountID = p_to_account_id;
            
            DBMS_OUTPUT.PUT_LINE('Updated balances:');
            DBMS_OUTPUT.PUT_LINE('From account (ID ' || p_from_account_id || '): $' || v_from_balance);
            DBMS_OUTPUT.PUT_LINE('To account (ID ' || p_to_account_id || '): $' || v_to_balance);
            DBMS_OUTPUT.NEW_LINE;
            
            -- Step 3: Fetch customer details using cursor
            v_customer_details := get_customer_details_from_account(p_from_account_id);
            FETCH v_customer_details INTO v_customer_id, v_customer_firstname, v_customer_lastname, v_linked_account_count;
            CLOSE v_customer_details;
            
            IF v_customer_id IS NOT NULL THEN
                DBMS_OUTPUT.PUT_LINE('Customer details for Account ' || p_from_account_id || ':');
                DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
                DBMS_OUTPUT.PUT_LINE('Name: ' || v_customer_firstname || ' ' || v_customer_lastname);
                DBMS_OUTPUT.PUT_LINE('Number of linked accounts: ' || v_linked_account_count);
                
                -- Calculate total balance for the customer
                v_total_balance := get_customer_total_balance(v_customer_id);
                DBMS_OUTPUT.PUT_LINE('Total balance across all accounts: $' || v_total_balance);
            ELSE
                DBMS_OUTPUT.PUT_LINE('No customer found linked to Account ' || p_from_account_id);
            END IF;
        ELSE
            DBMS_OUTPUT.PUT_LINE('Transfer was not successful. Customer details will not be displayed.');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Error: Insufficient funds in the from account (ID ' || p_from_account_id || ').');
    END IF;
    
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT_LINE('main_transfer_and_balance procedure completed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in main_transfer_and_balance: ' || SQLERRM);
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transaction rolled back due to error.');
END;
/
