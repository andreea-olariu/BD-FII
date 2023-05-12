/*
1. Scrieți o interogare pentru a afișa numele, prenumele, anul de studiu si data nașterii pentru toți studenții. Editați în SQL*Plus și executați. Salvați apoi interogarea intr-un fișier numit p1.sql.
2. Scrieți și executați o interogare pentru a afișa în mod unic valorile burselor.
3. Încărcați fișierul p1.sql în buffer. Dați fiecărei coloane din clauza SELECT un alias. Executați înterogarea.
4. Afișați numele concatenat cu prenumele urmat de virgulă și anul de studiu. Ordonați crescător după anul de studiu. Denumiți coloana “Studenți pe ani de studiu”.
5. Afișați numele, prenumele și data de naștere a studenților născuți între 1 ianuarie 1995 si 10 iunie 1997. Ordonați descendent după anul de studiu.
6. Afișați numele și prenumele precum și anii de studiu pentru toți studenții născuți în 1995.
7. Afișați studenții (toate informațiile pentru aceștia) care nu iau bursă.
8. Afișați studenții (nume și prenume) care iau bursă și sunt în anii 2 și 3 de studiu. Ordonați alfabetic ascendent după nume și descendent după prenume.
9. Afișați studenții care iau bursă, precum și valoarea bursei dacă aceasta ar fi mărită cu 15%.
10. Afișați studenții al căror nume începe cu litera P și sunt în anul 1 de studiu.
11. Afișați toate informațiile despre studenții care au două apariții ale literei “a” în prenume.
12. Afișați toate informațiile despre studenții al căror prenume este “Alexandru”, “Ioana” sau “Marius”.
13. Afișați studenții bursieri din semianul A.
14. Afișați toate informatiile despre studentii ale caror prenume contine EXACT o singura data litera 'a' (se ignora litera 'A' de la inceputul unor prenume).
15. Afişaţi numele şi prenumele profesorilor a căror prenume se termină cu litera "n" (întrebare capcană).
*/

1. SELECT nume || ' ' || prenume || ' ' || an || ' ' || data_nastere FROM studenti;
2. SELECT DISTINCT BURSA FROM STUDENTI;
4. SELECT nume || ', ' || prenume || ', ' || an AS "Studenti pe ani de studii" FROM studenti ORDER BY an DESC;
5. SELECT nume || ', ' || prenume || ', ' || data_nastere AS info FROM studenti WHERE data_nastere>='1-jAN-95' AND data_nastere <= '10-JUN-97' ORDER BY an DESC;
6. SELECT nume||' '||prenume||' '||an FROM studenti WHERE data_nastere BETWEEN '1-JAN-1995' AND '31-DEC-1995';
	 SELECT nume||' '||prenume||' '||data_nastere FROM studenti WHERE data_nastere LIKE '%95' ORDER BY data_nastere;
7. SELECT * FROM studenti WHERE bursa IS NULL;
8. SELECT nume || ' ' || prenume FROM studenti WHERE an IN (2,3) AND bursa IS NOT NULL ORDER BY nume, prenume DESC;
9. SELECT nume || ' ' || prenume || ' ' || 1.15 * bursa AS bursa_noua FROM STUDENTI WHERE bursa IS NOT NULL;
10. SELECT * FROM studenti WHERE an = 1 AND nume LIKE 'P%';
11. SELECT * FROM studenti WHERE prenume LIKE '%a%a%';
12. SELECT * FROM studenti WHERE prenume IN ('Ioana', 'Raluca', 'Marius');
13. SELECT * FROM studenti WHERE grupa LIKE 'A%' AND bursa IS NOT NULL;
14. SELECT * FROM studenti WHERE prenume LIKE '%a%' AND prenume NOT LIKE '%a%a%';
15. SELECT nume, prenume FROM profesori where prenume like '%n %' or prenume like '%n';
