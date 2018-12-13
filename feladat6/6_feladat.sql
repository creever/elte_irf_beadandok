/* A fenti k�rnyezetben k�sz�ts�k el a JUTALOM nev� proced�r�t, amely az egyenlegeket
   m�dos�tja annak megfelel�en, hogy a munkahely minden dolgoz�nak egy adott �sszeg� jutalmat ad.
   Minden dolgoz� egyenleg�t megn�veli az adott �sszeggel, a Munkahely egyenleg�t pedig cs�kkenti.
   A proced�r�nak mindenk�ppen m�dos�tania kell minden sz�ks�ges egyenleget, f�ggetlen�l att�l, hogy
   mikor fordulnak el� v�letlen hib�k a fenti trigger miatt. Ezeket az esetlegesen felmer�l� hib�kat
   hibakezel�ssel �s tranzakci� kezel� utas�t�sok (COMMIT/ROLLBACK) alkalmaz�s�val kell orvosolnia.
   A proced�ra a lefut�sa ut�n �rja ki, hogy �sszesen h�ny UPDATE m�veletet hajtott v�gre.
   (A sikeres �s sikertelen m�veleteket is sz�moljuk bele.)

   CREATE OR REPLACE PROCEDURE jutalom(p_osszeg number) IS

   Futtassuk le ciklusban 99-szer a jutalom(1)-et, majd ellen�rizz�k, hogy j�k-e az egyenlegek.
   A ciklusban val� futtat�s ut�n az �j egyenlegeket is el kell k�ldeni.
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
            DBMS_OUTPUT.PUT_LINE ('Pr�b�lkoz�s: ' || probalkozas);
            
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
    
    DBMS_OUTPUT.PUT_LINE (probalkozas || ' pr�b�lkoz�s ut�n sikeresen fizet�st adtunk.');
    
END;