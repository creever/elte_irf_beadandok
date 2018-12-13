/* A fenti környezetben készítsük el a JUTALOM nevû procedúrát, amely az egyenlegeket
   módosítja annak megfelelõen, hogy a munkahely minden dolgozónak egy adott összegû jutalmat ad.
   Minden dolgozó egyenlegét megnöveli az adott összeggel, a Munkahely egyenlegét pedig csökkenti.
   A procedúrának mindenképpen módosítania kell minden szükséges egyenleget, függetlenül attól, hogy
   mikor fordulnak elõ véletlen hibák a fenti trigger miatt. Ezeket az esetlegesen felmerülõ hibákat
   hibakezeléssel és tranzakció kezelõ utasítások (COMMIT/ROLLBACK) alkalmazásával kell orvosolnia.
   A procedúra a lefutása után írja ki, hogy összesen hány UPDATE mûveletet hajtott végre.
   (A sikeres és sikertelen mûveleteket is számoljuk bele.)

   CREATE OR REPLACE PROCEDURE jutalom(p_osszeg number) IS

   Futtassuk le ciklusban 99-szer a jutalom(1)-et, majd ellenõrizzük, hogy jók-e az egyenlegek.
   A ciklusban való futtatás után az új egyenlegeket is el kell küldeni.
*/

CREATE OR REPLACE PROCEDURE JUTALOM(p_osszeg IN number) IS
    fizetesek number := 0;
    sikeres boolean := FALSE;
    probalkozas number := 0;
    update_muvelet number := 0;
BEGIN
    WHILE NOT sikeres LOOP
        BEGIN
            probalkozas := probalkozas + 1;
            DBMS_OUTPUT.PUT_LINE ('Próbálkozás: ' || probalkozas);
            
            UPDATE BANKSZAMLA SET egyenleg=egyenleg+p_osszeg WHERE tulajdonos NOT IN ('Munkahely', 'Kincstar', 'Bolt');
            update_muvelet := update_muvelet + 1;
            DBMS_OUTPUT.PUT_LINE ('UP: ' || update_muvelet);
            fizetesek := p_osszeg * sql%rowcount;
            
            UPDATE BANKSZAMLA SET egyenleg=egyenleg - fizetesek WHERE tulajdonos = 'Munkahely';
            update_muvelet := update_muvelet + 1;
            DBMS_OUTPUT.PUT_LINE ('UP2: ' || update_muvelet);
            sikeres := TRUE;
            COMMIT;
            
            DBMS_OUTPUT.PUT_LINE ('COMMIT: ');
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE ('ROLLBACK');
                ROLLBACK;-- catches all 'no data found' errors
        END;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE (probalkozas || ' próbálkozás után sikeresen fizetést adtunk.');
    
END;