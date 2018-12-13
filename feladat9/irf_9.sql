CREATE OR REPLACE PROCEDURE hova(p_honnan varchar2) AS
BEGIN
  DECLARE
    CURSOR cur IS
      SELECT DISTINCT hova FROM jaratok
      START WITH honnan = p_honnan
      CONNECT BY NOCYCLE PRIOR hova = honnan;
      
      v_to jaratok.hova%TYPE;
  BEGIN
    OPEN cur;
    
    LOOP
      FETCH cur INTO v_to;
      EXIT WHEN cur%NOTFOUND;
      
      dbms_output.put_line(p_honnan || ' -> ' || v_to);
    END LOOP;
    
    CLOSE cur;
  END;
END;
/

CREATE OR REPLACE FUNCTION sum_costs (
  vals VARCHAR2
) RETURN NUMBER
AS
  num_vals SIMPLE_INTEGER := REGEXP_COUNT(vals, '\d+' );
  total jaratok.koltseg%TYPE := 0;
BEGIN
  FOR i IN 1 .. num_vals LOOP
    total := total + TO_NUMBER(REGEXP_SUBSTR(vals, '\d+', 1, i ));
  END LOOP;
  RETURN total;
END;
/

CREATE OR REPLACE PROCEDURE min_koltseg(p_honnan varchar2) AS
BEGIN
  DECLARE
    CURSOR cur IS
      WITH costs AS (
      SELECT     CONNECT_BY_ROOT honnan as honnan,
                 hova,
                 sum_costs(SYS_CONNECT_BY_PATH(koltseg, ',')) t_cost
      FROM       jaratok
      WHERE      CONNECT_BY_ROOT honnan <> hova
      CONNECT BY NOCYCLE PRIOR hova = honnan
      )
      SELECT
            honnan,
            hova,
            MIN(t_cost)
      FROM costs
      WHERE honnan = p_honnan
      GROUP BY honnan, hova;
      
      v_from jaratok.honnan%TYPE;
      v_to jaratok.hova%TYPE;
      v_min_cost jaratok.koltseg%TYPE;
  BEGIN
    OPEN cur;
    
    LOOP
      FETCH cur INTO v_from, v_to, v_min_cost;
      EXIT WHEN cur%NOTFOUND;
      
      dbms_output.put_line(v_from || ' -> ' || v_to || ': ' || v_min_cost);
      
    END LOOP;
    
    CLOSE cur;
  END;
END;
/

set serveroutput on;
execute hova('San Francisco');
execute min_koltseg('San Francisco');