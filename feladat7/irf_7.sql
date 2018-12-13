-- 7/1 - session1
DECLARE
    row1 dolgozo%ROWTYPE;
    row2 dolgozo%ROWTYPE;
BEGIN
	FOR index IN 1..1000000
	LOOP
		SELECT * INTO row1 FROM dolgozo WHERE dkod = 7566 FOR UPDATE;
		SELECT * INTO row2 FROM dolgozo WHERE dkod = 7839 FOR UPDATE;
		ROLLBACK;
	END LOOP;  
END;

-- 7/1 - session2
DECLARE
    row1 dolgozo%ROWTYPE;
    row2 dolgozo%ROWTYPE;
BEGIN
	FOR index IN 1..1000000
	LOOP
		SELECT * INTO row2 FROM dolgozo WHERE dkod = 7839 FOR UPDATE;
		SELECT * INTO row1 FROM dolgozo WHERE dkod = 7566 FOR UPDATE;
		ROLLBACK;
	END LOOP;  
END;


-- 7/2
CREATE OR REPLACE PROCEDURE not_serial IS  
    PROCEDURE update_employee AS
    PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        UPDATE dolgozo
        SET fizetes = fizetes - 1
        WHERE dkod = 7566;
        COMMIT;
    END;
BEGIN
	SET TRANSACTION ISOLATION LEVEL serializable;
    update_employee;
    
    UPDATE dolgozo
    SET fizetes = fizetes + 1
    WHERE dkod = 7566;
END;
/

set serveroutput on
execute not_serial();


-- 7/3
CREATE OR REPLACE PROCEDURE lock_test(p1 VARCHAR2, p2 VARCHAR2) IS
	sql1 VARCHAR2(1000);
	sql2 VARCHAR2(1000);
	sql3 VARCHAR2(128);
	sql4 VARCHAR2(128);
	sql_main VARCHAR2(128);
	
	FUNCTION func(p_lock VARCHAR2) RETURN VARCHAR2 IS
        lock_mode VARCHAR2(128);
    BEGIN
        CASE p_lock
            WHEN 'RS' THEN lock_mode := 'ROW SHARE';
            WHEN 'RX' THEN lock_mode := 'ROW EXCLUSIVE';
            WHEN 'S' THEN lock_mode := 'SHARE';
            WHEN 'SRX' THEN lock_mode := 'SHARE ROW EXCLUSIVE';
            WHEN 'X' THEN lock_mode := 'EXCLUSIVE';
            ELSE raise_application_error(-20000 , 'érvénytelen mód'); 
        END CASE; 
        RETURN lock_mode;
    END;
    PROCEDURE set_lock(lock_mode VARCHAR2) is
    PRAGMA AUTONOMOUS_TRANSACTION;
    BEGIN
        dbms_output.Put_line('sql: ' || utl_lms.format_message(sql1, lock_mode));
        EXECUTE IMMEDIATE  utl_lms.format_message(sql1, lock_mode);
        COMMIT;
    END;
BEGIN
    sql1 := 'LOCK TABLE dolgozo IN %s MODE';    
    sql2 := 'LOCK TABLE dolgozo IN :1 MODE';
	sql3 := func(p1);
    sql4 := func(p2);
    
    sql_main := utl_lms.format_message(sql1, sql3);
    EXECUTE IMMEDIATE sql_main;
    BEGIN
        set_lock(sql4);    
        COMMIT;
        dbms_output.put_line('OK');
    EXCEPTION
		WHEN OTHERS THEN
            dbms_output.put_line('NEM');
            dbms_output.put_line(SQLCODE ||' -- '|| SQLERRM);
    END; 
    ROLLBACK;
END;
/
set serveroutput on;
execute lock_test('X', 'S');
execute lock_test('RS', 'S');