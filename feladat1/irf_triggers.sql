-- 1/1
CREATE OR REPLACE 
TRIGGER trg1
    BEFORE UPDATE ON DOLGOZO
    FOR EACH ROW
DECLARE
    esemeny VARCHAR(80);
BEGIN
    
    IF :new.FIZETES > 4000 AND :old.FOGLALKOZAS = 'PRESIDENT' THEN
        esemeny := 'Fizetés nem változott';
        :new.FIZETES := :old.FIZETES;
    ELSIF :new.FIZETES > 4000 THEN
        esemeny := CONCAT(CONCAT(:old.FIZETES, ' '), :new.FIZETES);
    END IF;
       
    INSERT INTO TRIGGER_LOG (idopont, muvelet, esemeny) VALUES (SYSDATE, 'UPDATE', esemeny);
END;


-- 1/2a
CREATE OR REPLACE 
TRIGGER trg2a
    BEFORE UPDATE OR INSERT OR DELETE ON DOLGOZO
    REFERENCING OLD AS old
    NEW AS new
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    ossz_fizetes DOLGOZO.FIZETES%TYPE;
    event VARCHAR(6);
BEGIN
    SELECT (SUM(FIZETES) + :new.FIZETES) INTO ossz_fizetes FROM DOLGOZO;
    
    IF ossz_fizetes > 40000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Tul nagy osszfizetes');
    END IF;
    
    IF INSERTING THEN
        event := 'INSERT';
    ELSIF UPDATING THEN
        event := 'UPDATE';
    ELSIF DELETING THEN
        event := 'DELETE';
    END IF;
    INSERT INTO TRIGGER_LOG2 (idopont, muvelet, uj_osszfiz) VALUES (SYSDATE, event, ossz_fizetes);
    COMMIT;
END;

-- 1/2b
CREATE OR REPLACE 
TRIGGER trg2
    AFTER UPDATE OR INSERT OR DELETE ON DOLGOZO
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    ossz_fizetes DOLGOZO.FIZETES%TYPE;
    event VARCHAR(6);
BEGIN
    SELECT (SUM(FIZETES) + :new.FIZETES) INTO ossz_fizetes FROM DOLGOZO;
    
    IF INSERTING THEN
        event := 'INSERT';
    ELSIF UPDATING THEN
        event := 'UPDATE';
    ELSIF DELETING THEN
        event := 'DELETE';
    END IF;
    INSERT INTO TRIGGER_LOG2 (idopont, muvelet, uj_osszfiz) VALUES (SYSDATE, event, ossz_fizetes);
    COMMIT;
    
    IF ossz_fizetes > 40000 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Tul nagy osszfizetes');
    END IF;
END;


-- 1/3
CREATE OR REPLACE 
TRIGGER trg3
    INSTEAD OF UPDATE ON DEPT_SAL
    FOR EACH ROW
DECLARE
    PRAGMA AUTONOMOUS_TRANSACTION;
    sal_diff DOLGOZO.FIZETES%TYPE;
BEGIN
    
    IF :old.DNAME <> :new.DNAME THEN
        UPDATE DEPT SET DNAME = :new.DNAME WHERE DNAME = :old.DNAME;
    ELSIF :old.SUMSAL <> :new.SUMSAL THEN
        SELECT ((:new.SUMSAL - SUM(SAL)) / COUNT(*)) 
        INTO sal_diff 
        FROM DEPT, EMP 
        WHERE EMP.DEPTNO = DEPT.DEPTNO AND DEPT.DNAME = :old.DNAME;
        
        UPDATE EMP
        SET SAL = (SAL + sal_diff)
        WHERE EXISTS (SELECT *
                      FROM DEPT
                      WHERE DEPT.DEPTNO = EMP.DEPTNO AND DEPT.DNAME = :old.DNAME);
    END IF;
    COMMIT;
END;


-- 1/4
CREATE OR REPLACE 
TRIGGER trg4
BEFORE DDL ON IYB4JH.SCHEMA
BEGIN
    INSERT INTO DDL_LOG (tulajdonos, obj_nev, obj_tipus, muvelet, idopont) VALUES (ora_login_user, ora_dict_obj_name, ora_dict_obj_type, ora_sysevent, SYSDATE);
END;


-- 1/5
CREATE OR REPLACE 
TRIGGER trg5
AFTER LOGON ON DATABASE
BEGIN
    INSERT INTO NAPLO (datum, felh, gep, ip, osuser) VALUES (SYSDATE, ora_login_user, SYS_CONTEXT('USERENV','HOST'), ora_client_ip_address, SYS_CONTEXT('USERENV','OS_USER'));
END;