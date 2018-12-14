create or replace PROCEDURE TANFOLYAM_SZAMLA IS
    sd DATE;
    ed DATE;
    cname VARCHAR2(255);
    caddress VARCHAR2(255);
    ccode VARCHAR2(255);
    cprice number;
    participant VARCHAR2(255);
BEGIN
    SELECT course.start_date, course.end_date, course_type.name, place.address, course.code, course_price.price, booking.participant
      into sd, ed, cname, caddress, ccode, cprice, participant
        FROM booking 
        JOIN course ON course.code=booking.course_code 
        JOIN course_type ON course_type.code=course.course_type_code 
        JOIN place ON place.code=course.place_code 
        JOIN course_price ON course_price.course_type_code=course.course_type_code 
        WHERE ROWNUM = 1;
    
    dbms_output.put_line('Alapítva 1978-ban	Igazgató: N. Wisdom, Ph.D');
    dbms_output.put_line('Fawlty Tours Ltd.');
    dbms_output.put_line('Holiday House	Számlaszám:' || chr(9) || '0017');
    dbms_output.put_line('Letsby Avenue');
    dbms_output.put_line('Basildon, Essex');
    dbms_output.put_line('S. Pegler figyelmébe	' || chr(9) || 'Dátum: ' || to_char(sd, 'yyyy-mm-dd'));
    dbms_output.put_line('KURZUS:' || chr(9) || ccode);
    dbms_output.put_line('KURZUS CÍM:' || chr(9) || cname);
    dbms_output.put_line('KURZUS IDEJE:	' || chr(9) || to_char(sd, 'MON DD - ') || to_char(ed, 'DD.'));
    dbms_output.put_line('TANDÍJ:	' || chr(9) || cprice);
    dbms_output.put_line('KÜLDÖTTEK: ' || participant || chr(9) || cprice);
    dbms_output.put_line('Netto összeg' || chr(9) || cprice);
    dbms_output.put_line('ÁFA 17.5%	' || chr(9) || cprice * 0.175);
    
    dbms_output.put_line('Ügyfél fõkönyvi száma:' || chr(9) || '15913');
    dbms_output.put_line('Számla összeg' || chr(9) || cprice * 1.175);
END;