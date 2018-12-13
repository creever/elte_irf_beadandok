create or replace PROCEDURE TANFOLYAM_UTEMTERV IS
    p_code VARCHAR2(255);
    p_name VARCHAR2(255);
    p_address VARCHAR2(255);
    megerositett INTEGER;
    ideiglenes INTEGER;
    keszenlet VARCHAR2(255);
    osszesen INTEGER;
    
     ct_code VARCHAR2(255);
     ct_name VARCHAR2(255);
     ct_min VARCHAR2(255);
     ct_max VARCHAR2(255);
BEGIN

    dbms_output.put_line(
        'Dátum' || chr(9) || 
        'Tanfkód' || chr(9) || 
        'Tanf leírás' || chr(9) ||
        'Tanf felelõs' || chr(9) ||
        'Tanf helye' || chr(9) ||
        'Elõadó' || chr(9) ||
        'Max' || chr(9) ||
        'ideig' || chr(9) ||
        'biztos' || chr(9) ||
        'Össz' || chr(9) ||
        'Készn' || chr(9) ||
        'Mégj'
    );

    FOR item IN 
        (
            SELECT * FROM course ORDER BY start_date
        )
    LOOP

        SELECT code, name, address into p_code, p_name, p_address FROM place WHERE code = item.place_code;
        SELECT code, name, min, max into ct_code, ct_name, ct_min, ct_max FROM course_type WHERE code = item.course_type_code;
        SELECT COUNT(*) into megerositett FROM booking WHERE course_code = item.code AND status='Megerositett';
        SELECT COUNT(*) into ideiglenes FROM booking WHERE course_code = item.code AND status='Ideiglenes';
        SELECT COUNT(*) into ideiglenes FROM booking WHERE course_code = item.code AND status='Ideiglenes + Készenlét';
        
        osszesen := megerositett + ideiglenes;
        
        dbms_output.put_line(
            to_char(item.start_date, 'yyyy-mm-dd') || ' - ' || to_char(item.end_date, 'yyyy-mm-dd') || chr(9) || 
            item.code || chr(9) || 
            item.description || chr(9) ||
            item.teacher_code || chr(9) ||
            p_address || chr(9) ||
            p_name || chr(9) ||
            ct_max || chr(9) ||
            ideiglenes || chr(9) ||
            megerositett || chr(9) ||
            osszesen || chr(9) ||
            keszenlet || chr(9) ||
            item.note
        );
    END LOOP;
END;