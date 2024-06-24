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
/
