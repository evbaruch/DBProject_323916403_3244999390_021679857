CREATE OR REPLACE TRIGGER trg_generate_transaction_id
BEFORE INSERT ON Transactions
FOR EACH ROW
BEGIN
    SELECT COALESCE(MAX(TransactionID), 0) + 1 INTO :NEW.TransactionID FROM Transactions;
END;
/
