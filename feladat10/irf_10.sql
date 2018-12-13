CREATE OR REPLACE FUNCTION mely_tablak(p_user VARCHAR2) RETURN VARCHAR2 IS
ret VARCHAR2(2000);
BEGIN
  SELECT LISTAGG(table_name, ', ') WITHIN GROUP (ORDER BY table_name) INTO ret
  FROM (SELECT grantee, table_name 
        FROM dba_tab_privs
        WHERE owner = 'ORAUSER' AND privilege = 'INSERT' AND grantee = upper('nikovits')
        UNION
        SELECT d.grantee, t.table_name
        FROM dba_sys_privs d, (SELECT table_name FROM dba_tables WHERE owner='ORAUSER') t
        WHERE privilege = 'INSERT ANY TABLE' AND grantee = upper(p_user));
    RETURN ret;
END mely_tablak;

SELECT mely_tablak('nikovits'), mely_tablak('hallgato'), 
       mely_tablak('sila'), mely_tablak('blabla') 
FROM dual;