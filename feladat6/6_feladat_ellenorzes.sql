set serveroutput on;
DECLARE
    CURSOR alkalmazottak IS SELECT * FROM BANKSZAMLA WHERE tulajdonos NOT IN ('Munkahely', 'Kincstar', 'Bolt');
    tulajdonos_eredeti_egyenleg number := 0;
    tulajdonos_uj_egyenleg number := 0;
    loop_hossz number := 99;
    jutalom_osszege number := 1;
    uj_fizetes number := 0;
    item alkalmazottak%ROWTYPE;
    alkalmazottak_szama number := 0;
BEGIN
    OPEN alkalmazottak;
    SELECT egyenleg into tulajdonos_eredeti_egyenleg FROM BANKSZAMLA WHERE tulajdonos = 'Munkahely';
    
    FOR i IN 1..loop_hossz LOOP 
        JUTALOM(jutalom_osszege);
    END LOOP;
    
    LOOP
        FETCH alkalmazottak INTO item;
        EXIT WHEN alkalmazottak%NOTFOUND;
      
        SELECT egyenleg into uj_fizetes FROM BANKSZAMLA WHERE tulajdonos = item.tulajdonos;
        IF uj_fizetes = item.egyenleg + loop_hossz * jutalom_osszege  THEN
            DBMS_OUTPUT.PUT_LINE (item.tulajdonos || ' új egyenlege megfelelõ: ' || 
                uj_fizetes || ' == ' || (item.egyenleg + loop_hossz * jutalom_osszege)
            );
        ELSE 
            DBMS_OUTPUT.PUT_LINE (item.tulajdonos || ' új egyenlege hibás: ' || 
                uj_fizetes || ' != ' || (item.egyenleg + loop_hossz * jutalom_osszege)
            );
        END IF;
        
        alkalmazottak_szama := alkalmazottak_szama + 1;
    END LOOP;
    
    SELECT egyenleg into tulajdonos_uj_egyenleg FROM BANKSZAMLA WHERE tulajdonos = 'Munkahely';
    
    IF tulajdonos_uj_egyenleg = tulajdonos_eredeti_egyenleg - (loop_hossz * jutalom_osszege * alkalmazottak_szama)  THEN
        DBMS_OUTPUT.PUT_LINE ('A munkahely új egyenlege megfelelõ: ' || 
            tulajdonos_uj_egyenleg || ' == ' || (tulajdonos_eredeti_egyenleg - (loop_hossz * jutalom_osszege * alkalmazottak_szama))
        );
    ELSE 
        DBMS_OUTPUT.PUT_LINE ('A tulajdonos új egyenlege hibás: ' ||
            tulajdonos_uj_egyenleg || ' != ' || tulajdonos_eredeti_egyenleg + (loop_hossz * jutalom_osszege * alkalmazottak_szama)
        );
    END IF;
    
    CLOSE alkalmazottak;
    
END;