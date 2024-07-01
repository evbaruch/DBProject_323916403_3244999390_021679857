[StageThree](#stage-three)

5. [General Description](#general-description)
6. [Code](#code)
   <details>
   <summary>Subsections</summary>

   - [Functions](#functions)
   - [Procedures](#procedures)
   - [Triggers](#triggers)
   - [Mains](#mains)

   </details>

7. [Testing](#testing)
8. [Backup](#backup)

# Stage Three

## General description

this stage is about creating a PL/SQL package that contains procedures and functions to perform various operations on the database. The package includes the following elements:

- **Functions:**

  - **GetRecentTransactions:** This function retrieves the most recent transactions from the Transactions table based on the specified number of transactions to return.

  [here](/StageThree/Functions/Function1%20-%20get_recent_transactions.fnc)

  - **GetCustomerTotalBalance:** This function calculates the total balance of a specific customer based on the CustomerID.

  [here](/StageThree/Functions/Function2%20-%20get_customer_total_balance.fnc)

  - **GetCustomerDetailsFromAccount:** This function retrieves customer details based on the AccountID.

  [here](/StageThree/Functions/Function3%20-%20get_customer_details_from_account.fnc)

- **Procedures:**

  - **CreateCustomerAndAccount:** This procedure creates a new customer and account in the database. It takes input parameters for the customer details and account balance.

  [here](/StageThree/Procedures/Procedure1%20-%20create_customer_and_account.prc)

  - **TransferMoney:** This procedure transfers a specified amount of money from one account to another. It takes input parameters for the source and destination account IDs and the amount to transfer.
    [here](/StageThree/Procedures/Procedure2%20-%20transfer_money.prc)

**triggers:**

-**Transaction Triggeer ID:** This trigger automatically generates a unique TransactionID for each new transaction inserted into the Transactions table.

[here](/StageThree/Triggers/trg_generate_transaction_id.trg)

-**Account Trigger ID:** This trigger automatically generates a unique AccountID for each new account inserted into the Account table.

[here](/StageThree/Triggers/trg_generate_account_id.trg)

-**Customer Trigger ID:** This trigger automatically generates a unique CustomerID for each new customer inserted into the Customer table.

[here](/StageThree/Triggers/trg_generate_customer_id.trg)

-**Branch Trigger ID:** This trigger automatically generates a unique BranchID for each new branch inserted into the Branch table.

(note: not used because the branches are not unique for each customer)

[here](/StageThree/Triggers/trg_generate_branch_id.trg)

-**Direct Debit Trigger ID:** This trigger automatically generates a unique IDDebit for each new direct debit arrangement inserted into the DirectDebit table.

[here](/StageThree/Triggers/trg_generate_directdebit_id.trg)

## Code

### Functions:

1. **GetRecentTransactions:**

```sql
/*
  Function Name: get_recent_transactions
  Purpose:
    This function retrieves recent transactions for a given account within a specified number of days.
  Parameters:
    p_account_id (IN NUMBER) - The ID of the account for which recent transactions are to be retrieved.
    p_days (IN NUMBER) - The number of past days to consider for retrieving transactions.
  Returns:
    SYS_REFCURSOR - A cursor containing the transaction details (TransactionID, TransactionType, Amount, TransactionDate).
  Usage:
    This function can be called by passing an account ID and the number of days to retrieve recent transactions.
  Features Used:
    a. Ref Cursor - Used to return the result set of recent transactions.
    b. Exception Handling - Used to catch and log any errors that occur during the execution of the function.
  Notes:
    - This function performs a SELECT operation on the Transactions table.
    - Proper exception handling ensures that errors are logged and handled gracefully.
    - The function assumes that the structure of the Transactions table is known and correct.
*/

CREATE OR REPLACE FUNCTION get_recent_transactions(p_account_id IN NUMBER, p_days IN NUMBER)
RETURN SYS_REFCURSOR
IS
    v_transactions SYS_REFCURSOR;
BEGIN
    OPEN v_transactions FOR
        SELECT TransactionID, TransactionType, Amount, TransactionDate
        FROM Transactions
        WHERE AccountID = p_account_id
          AND TransactionDate >= SYSDATE - p_days
        ORDER BY TransactionDate DESC;

    RETURN v_transactions;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in get_recent_transactions: ' || SQLERRM);
        RETURN NULL;
END;
```

2. **GetCustomerTotalBalance:**

```sql
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
```

3. **GetCustomerDetailsFromAccount:**

```sql
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
```

4. **get customer id from account id:**

```sql
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
```

### Procedures:

1. **CreateCustomerAndAccount:**

```sql
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
```

2. **TransferMoney:**

```sql
/*
  Procedure Name: transfer_money
  Purpose:
    This procedure transfers money from one account to another and records the transactions.
  Parameters:
    p_from_account (IN NUMBER) - The ID of the account from which money is to be transferred.
    p_to_account (IN NUMBER) - The ID of the account to which money is to be transferred.
    p_amount (IN NUMBER) - The amount of money to be transferred.
  Features Used:
    a. DML Commands - Uses INSERT to record transactions and UPDATE to adjust account balances.
    b. Exception Handling - Used to catch and log any errors that occur during the execution of the procedure.
    c. Trigger - Uses a trigger to generate unique transaction IDs.
  Notes:
    - This procedure assumes the existence of a trigger named 'trg_generate_transaction_id' for generating unique transaction IDs.
    - Proper exception handling ensures that errors are logged and handled gracefully.
    - Informative output is added to provide feedback on the transaction process.
*/

CREATE OR REPLACE PROCEDURE transfer_money (
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
BEGIN
    -- Deduct the amount from the source account
    UPDATE Account
    SET Balance = Balance - p_amount
    WHERE AccountID = p_from_account;
    DBMS_OUTPUT.PUT_LINE('Deducted ' || p_amount || ' from account ' || p_from_account);

    -- Add the amount to the destination account
    UPDATE Account
    SET Balance = Balance + p_amount
    WHERE AccountID = p_to_account;
    DBMS_OUTPUT.PUT_LINE('Added ' || p_amount || ' to account ' || p_to_account);

    -- Record the outgoing transaction
    INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
    VALUES (p_from_account, 'TRANSFER_OUT', p_amount, SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Recorded outgoing transaction for account ' || p_from_account);
    DBMS_OUTPUT.NEW_LINE;

    -- Record the incoming transaction
    INSERT INTO Transactions (AccountID, TransactionType, Amount, TransactionDate)
    VALUES (p_to_account, 'TRANSFER_IN', p_amount, SYSDATE);
    DBMS_OUTPUT.PUT_LINE('Recorded incoming transaction for account ' || p_to_account);

    -- Commit the transaction
    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Transaction committed successfully.');
    DBMS_OUTPUT.NEW_LINE;
EXCEPTION
    -- Handle any exceptions that occur
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error in transfer_money: ' || SQLERRM);
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Transaction rolled back due to error.');
END transfer_money;
```

### Triggers:

1. **Transaction Triggeer ID:**

```sql
CREATE OR REPLACE TRIGGER trg_generate_transaction_id
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
    SELECT COALESCE(MAX(TransactionID), 0) + 1 INTO :NEW.TransactionID FROM Transactions;
END;
```

2. **Account Trigger ID:**

```sql
CREATE OR REPLACE TRIGGER trg_generate_account_id
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
    SELECT COALESCE(MAX(AccountID), 0) + 1 INTO :NEW.AccountID FROM Account;
END;
```

3. **Customer Trigger ID:**

```sql
CREATE OR REPLACE TRIGGER trg_generate_customer_id
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    SELECT COALESCE(MAX(CustomerID), 0) + 1 INTO :NEW.CustomerID FROM Customer;
END;
```

### Mains

1. **Main 1:**

```sql
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
```

2. **Main 2:**

```sql
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
```

## Testing

**Function 1: GetRecentTransactions**

> this is the test genereated for the function `GetRecentTransactions`:

```sql
begin
  -- Call the function
  :result := get_recent_transactions(p_account_id => :p_account_id,
                                     p_days => :p_days);
end;
```

> this is the output of the test:
> ![video](/StageThree/Videos/get_recent_transactions.mp4)

**Function 2: GetCustomerTotalBalance**

> this is the test genereated for the function `GetCustomerTotalBalance`:

```sql
begin
  -- Call the function
  :result := get_customer_total_balance(p_customer_id => :p_customer_id);
end;
```

> this is the output of the test:

![image](/StageThree/Videos/Get%20Customer%20Total%20Balance%20Script.png)

![image](/StageThree/Videos/Get%20Customer%20Total%20Balance.png)

**Function 3: GetCustomerDetailsFromAccount**

> this is the test genereated for the function `GetCustomerDetailsFromAccount`:

```sql
begin
  -- Call the function
  :result := get_customer_details_from_account(p_account_id => :p_account_id);
end;
```

> this is the output of the test:
> ![here](/StageThree/Videos/OutPut%20Get%20details%20Customer%20.png)

**Procedure 1: CreateCustomerAndAccount**

> this is the test genereated for the procedure `CreateCustomerAndAccount`:

```sql
begin
  -- Call the procedure
  create_customer_and_account(p_first_name => :p_first_name,
                              p_last_name => :p_last_name,
                              p_dob => :p_dob,
                              p_address => :p_address,
                              p_contact_number => :p_contact_number,
                              p_email => :p_email,
                              p_initial_deposit => :p_initial_deposit,
                              p_branch_id => :p_branch_id);
end;
```

> this is the output of the test:

![image](/StageThree/Videos/Create%20Customer%20-%20Account.png)

**Procedure 2: TransferMoney**

> this is the test genereated for the procedure `TransferMoney`:

```sql
begin
  -- Call the procedure
  transfer_money(p_from_account => :p_from_account,
                 p_to_account => :p_to_account,
                 p_amount => :p_amount);
end;
```

> this is the output of the test:
> ![image](/StageThree/Videos/Transfer%20Money.png)

**Main 1: new_customer_and_transactions**

> this is the test genereated for the procedure `new_customer_and_transactions`:

```sql
begin
  -- Call the procedure
  new_customer_and_transactions(p_first_name => :p_first_name,
                                p_last_name => :p_last_name,
                                p_dob => :p_dob,
                                p_address => :p_address,
                                p_phone => :p_phone,
                                p_email => :p_email,
                                p_initial_deposit => :p_initial_deposit,
                                p_branch_id => :p_branch_id);
end;
```

> this is the output of the test:

![image](/StageThree/Videos/new%20account%20and%20transaction.png)

**Main 2: main_transfer_and_balance**

> this is the test genereated for the procedure `main_transfer_and_balance`:

```sql
begin
  -- Call the procedure
  main_transfer_and_balance(p_transfer_amount => :p_transfer_amount,
                            p_from_account_id => :p_from_account_id,
                            p_to_account_id => :p_to_account_id);
end;
```

> this is the output of the test:
> ![image](/StageThree/Videos/Transfer%20and%20balence%20.png)

## backup

the backup file is [here](/StageThree/backupSql.sql)

in Yehuda's repository
![here](/StageThree/Videos/photo_2024-07-01_14-27-18.jpg)
