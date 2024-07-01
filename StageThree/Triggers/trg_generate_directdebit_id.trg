CREATE OR REPLACE TRIGGER trg_generate_Directdebit_id
BEFORE INSERT ON Directdebit
FOR EACH ROW
BEGIN
    SELECT COALESCE(MAX(IDDEBIT), 0) + 1 INTO :NEW.IDDEBIT FROM Directdebit;
END;
/
