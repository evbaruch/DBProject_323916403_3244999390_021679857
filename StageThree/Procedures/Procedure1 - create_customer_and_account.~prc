/*
  Procedure Name: create_customer_and_account
  Purpose:
    This procedure creates a new customer and a new account for the customer,
    links the customer to the account, and records the initial deposit transaction.
    If the customer already exists, it creates a new account for the customer.
  Parameters:
    p_first_name (IN VARCHAR2) - First name of the customer.
    p_last_name (IN VARCHAR2) - Last name of the customer.
    p_dob (IN DATE) - Date of birth of the customer.
    p_address (IN VARCHAR2) - Address of the customer.
    p_contact_number (IN NUMBER) - Contact number of the customer.
    p_email (IN VARCHAR2) - Email of the customer.
    p_initial_deposit (IN NUMBER) - Initial deposit amount for the account.
    p_branch_id (IN NUMBER) - Branch ID where the account is created.
  Features Used:
    a. DML Commands - Uses INSERT to add new records to Customer, Account, Relationship, and Transactions tables.
    b. Exception Handling - Used to catch and log any errors that occur during the execution of the procedure.
    c. Triggers - Uses triggers to generate unique IDs for Customer, Account, and Transactions.
  Notes:
    - This procedure assumes the existence of triggers named 'trg_generate_customer_id', 'trg_generate_account_id', and 'trg_generate_transaction_id' for generating unique IDs.
    - Proper exception handling ensures that errors are logged and handled gracefully.
*/

CREATE OR REPLACE PROCEDURE create_customer_and_account(
  p_first_name IN VARCHAR2,
  p_last_name IN VARCHAR2,
  p_dob IN DATE,
  p_address IN VARCHAR2,
  p_contact_number IN NUMBER,
  p_email IN VARCHAR2,
  p_initial_deposit IN NUMBER,
  p_branch_id IN NUMBER
)
IS
  v_customer_id NUMBER;
  v_account_id NUMBER;
BEGIN
  -- Check if the customer already exists
  BEGIN
    SELECT CustomerID INTO v_customer_id
    FROM Customer
    WHERE FirstName = p_first_name
      AND LastName = p_last_name
      AND DateOfBirth = p_dob
      AND ContactNumber = p_contact_number;
    
    DBMS_OUTPUT.PUT_LINE('Existing customer found with ID: ' || v_customer_id);
  EXCEPTION
    WHEN NO_DATA_FOUND THEN
      -- Customer does not exist, create a new customer
      INSERT INTO Customer (FirstName, LastName, DateOfBirth, Address, ContactNumber, Email)
      VALUES (p_first_name, p_last_name, p_dob, p_address, p_contact_number, p_email)
      RETURNING CustomerID INTO v_customer_id;
      
      DBMS_OUTPUT.PUT_LINE('New customer created successfully.');
      DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
  END;
  
  -- Create new account
  INSERT INTO Account (Balance, DateOpened, AccountStatus, BranchID)
  VALUES (p_initial_deposit, SYSDATE, 'ACTIVE', p_branch_id)
  RETURNING AccountID INTO v_account_id;
  
  DBMS_OUTPUT.PUT_LINE('New account created successfully.');
  DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_account_id);
  
  -- Link customer to account
  INSERT INTO Relationship (CustomerID, AccountID)
  VALUES (v_customer_id, v_account_id);
  
  DBMS_OUTPUT.PUT_LINE('Customer linked to account successfully.');
  DBMS_OUTPUT.NEW_LINE;
  
  -- Record initial deposit transaction
  INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
  VALUES (v_account_id, 'DEPOSIT', p_initial_deposit, SYSDATE);
  
  DBMS_OUTPUT.PUT_LINE('Initial deposit transaction recorded successfully.');
  DBMS_OUTPUT.PUT_LINE('Initial deposit amount: ' || p_initial_deposit);
  
  -- Commit the transaction
  COMMIT;
  
  DBMS_OUTPUT.PUT_LINE('Customer and account creation process completed successfully.');
  DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer_id);
  DBMS_OUTPUT.PUT_LINE('Account ID: ' || v_account_id);
  DBMS_OUTPUT.NEW_LINE;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error in create_customer_and_account: ' || SQLERRM);
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Transaction rolled back due to error.');
END create_customer_and_account;
/
