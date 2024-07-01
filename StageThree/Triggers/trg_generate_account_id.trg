CREATE OR REPLACE TRIGGER trg_generate_account_id
BEFORE INSERT ON Account
FOR EACH ROW
BEGIN
    SELECT COALESCE(MAX(AccountID), 0) + 1 INTO :NEW.AccountID FROM Account;
END;
/