CREATE OR REPLACE PROCEDURE new_customer_and_transactions(
  p_first_name IN VARCHAR2,
  p_last_name IN VARCHAR2,
  p_dob IN DATE,
  p_address IN VARCHAR2,
  p_phone IN NUMBER,
  p_email IN VARCHAR2,
  p_initial_deposit IN NUMBER,
  p_branch_id IN NUMBER
)
IS
  v_customer_id NUMBER;
  v_account_id NUMBER;
  v_transactions SYS_REFCURSOR;
  v_transaction_id NUMBER;
  v_transaction_type VARCHAR2(50);
  v_amount NUMBER;
  v_transaction_date DATE;
  v_total_amount NUMBER := 0;
  v_transaction_count NUMBER := 0;
BEGIN
  DBMS_OUTPUT.PUT_LINE('Starting new_customer_and_transactions procedure...');
  DBMS_OUTPUT.NEW_LINE;
  
  -- Validate BranchID
  BEGIN
    DECLARE
      v_temp_branch_id NUMBER;
    BEGIN
      SELECT BranchID INTO v_temp_branch_id
      FROM Branch
      WHERE BranchID = p_branch_id;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid BranchID provided.');
        RETURN;
    END;
  END;
  
  -- Create new customer and account
  create_customer_and_account(
    p_first_name, p_last_name, p_dob,
    p_address, p_phone, p_email,
    p_initial_deposit, p_branch_id  -- Use the provided BranchID
  );
  
  -- Get the newly created customer and account IDs
  BEGIN
    SELECT c.CustomerID, r.AccountID
    INTO v_customer_id, v_account_id
    FROM Customer c
    JOIN Relationship r ON c.CustomerID = r.CustomerID
    WHERE c.FirstName = p_first_name AND c.LastName = p_last_name
    AND ROWNUM = 1;
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      DBMS_OUTPUT.PUT_LINE('Error: Unable to find the newly created customer and account.');
      RETURN;
  END;
  
  -- Log customer and account creation success
  DBMS_OUTPUT.PUT_LINE('New customer created successfully.');
  DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
  DBMS_OUTPUT.PUT_LINE('New account created successfully.');
  DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_account_id);
  DBMS_OUTPUT.NEW_LINE;

  -- End of Manager-like section
  
  -- Get recent transactions
  v_transactions := get_recent_transactions(v_account_id, 30);
  
  DBMS_OUTPUT.PUT_LINE('Recent transactions for the new account:');
  LOOP
    FETCH v_transactions INTO v_transaction_id, v_transaction_type, v_amount, v_transaction_date;
    EXIT WHEN v_transactions%NOTFOUND;
    
    v_total_amount := v_total_amount + v_amount;
    v_transaction_count := v_transaction_count + 1;
    
    DBMS_OUTPUT.PUT_LINE(
      'Transaction ID: ' || v_transaction_id ||
      ', Type: ' || v_transaction_type ||
      ', Amount: $' || v_amount ||
      ', Date: ' || TO_CHAR(v_transaction_date, 'YYYY-MM-DD')
    );
  END LOOP;
  CLOSE v_transactions;
  
  DBMS_OUTPUT.NEW_LINE;
  DBMS_OUTPUT.PUT_LINE('Transaction summary:');
  DBMS_OUTPUT.PUT_LINE('Total number of transactions: ' || v_transaction_count);
  DBMS_OUTPUT.PUT_LINE('Total amount of transactions: $' || v_total_amount);
  IF v_transaction_count > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Average transaction amount: $' || ROUND(v_total_amount / v_transaction_count, 2));
  ELSE
    DBMS_OUTPUT.PUT_LINE('Average transaction amount: $0 (No transactions)');
  END IF;
  
  DBMS_OUTPUT.NEW_LINE;
  DBMS_OUTPUT.PUT_LINE('new_customer_and_transactions procedure completed.');
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error in new_customer_and_transactions: ' || SQLERRM);
    ROLLBACK;
END;
/
