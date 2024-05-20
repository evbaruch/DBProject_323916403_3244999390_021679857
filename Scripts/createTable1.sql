DECLARE
    v_count NUMBER;
    TYPE t_table_names IS TABLE OF VARCHAR2(30);
    v_table_names t_table_names := t_table_names('Customer', 'Account', 'Transactions', 'DirectDebit', 'Rel5', 'BlackList', 'Vip', 'Branch');
BEGIN
    FOR i IN 1..v_table_names.COUNT LOOP
        SELECT COUNT(*)
        INTO v_count
        FROM user_tables
        WHERE table_name = UPPER(v_table_names(i));

        IF v_count = 0 THEN
            dbms_output.put_line('Table ' || v_table_names(i) || ' does not exist.');
        ELSE
            dbms_output.put_line('Table ' || v_table_names(i) || ' exists. Its structure is:');

            FOR r IN (SELECT column_name, data_type, data_length
                      FROM user_tab_columns
                      WHERE table_name = UPPER(v_table_names(i))
                      ORDER BY column_id) LOOP
                dbms_output.put_line(r.column_name || ' ' || r.data_type || '(' || r.data_length || ')');
            END LOOP;
        END IF;

        dbms_output.put_line('-------------------------');
    END LOOP;
END;
/
