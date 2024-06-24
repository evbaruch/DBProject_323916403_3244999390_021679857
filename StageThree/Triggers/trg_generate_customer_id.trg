CREATE OR REPLACE TRIGGER trg_generate_customer_id
BEFORE INSERT ON Customer
FOR EACH ROW
BEGIN
    SELECT COALESCE(MAX(CustomerID), 0) + 1 INTO :NEW.CustomerID FROM Customer;
END;
/
/
