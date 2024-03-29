/*

1. Scrieți o interogare pentru a afișa data de azi. Etichetați coloana "Astazi".
2. Pentru fiecare student afișați numele, data de nastere si numărul de luni între data curentă și data nașterii.
3. Afișați ziua din săptămână în care s-a născut fiecare student.
4. Utilizând functia de concatenare, obțineți pentru fiecare student textul 'Elevul <prenume> este in grupa <grupa>'.
5. Afisati valoarea bursei pe 10 caractere, completand valoarea numerica cu caracterul $.
6. Pentru profesorii al căror nume începe cu B, afișați numele cu prima litera mică si restul mari, precum și lungimea (nr. de caractere a) numelui.
7. Pentru fiecare student afișați numele, data de nastere, data la care studentul urmeaza sa isi sarbatoreasca ziua de nastere si prima zi de duminică de dupa.
8. Ordonați studenții care nu iau bursă în funcție de luna cand au fost născuți; se va afișa doar numele, prenumele și luna corespunzătoare datei de naștere.
9. Pentru fiecare student afișati numele, valoarea bursei si textul: 'premiul 1' pentru valoarea 450, 'premiul 2' pentru valoarea 350, 'premiul 3' pentru valoarea 250 și 'mentiune' pentru cei care nu iau bursa. Pentru cea de a treia coloana dati aliasul "Premiu".
10. Afişaţi numele tuturor studenților înlocuind apariţia literei i cu a şi apariţia literei a cu i.
11. Afișați pentru fiecare student numele, vârsta acestuia la data curentă sub forma '<x> ani <y> luni și <z> zile' (de ex '19 ani 3 luni și 2 zile') și numărul de zile până își va sărbători (din nou) ziua de naștere.
12. Presupunând că în următoarea lună bursa de 450 RON se mărește cu 10%, cea de 350 RON cu 15% și cea de 250 RON cu 20%, afișați pentru fiecare student numele acestuia, data corespunzătoare primei zile din luna urmatoare și valoarea bursei pe care o va încasa luna următoare. Pentru cei care nu iau bursa, se va afisa valoarea 0.
13. Pentru studentii bursieri (doar pentru ei) afisati numele studentului si bursa in stelute: fiecare steluta valoreaza 50 RON. In tabel, alineati stelutele la dreapta.
*/

SELECT CURRENT_DATE "Astazi" FROM DUAL
/
SELECT nume, prenume, MONTHS_BETWEEN(sysdate, data_nastere) FROM studenti
/
SELECT TO_CHAR(data_nastere, 'DAY') as "ziua" FROM studenti
/
SELECT CONCAT('ELEVUL ', CONCAT(prenume, CONCAT(' ESTE IN GRUPA ', grupa))) as "Mesaj" FROM studenti
/
SELECT RPAD(TO_CHAR(bursa), 10, '$') AS "bursa_noua" FROM studenti WHERE bursa IS NOT NULL
/
SELECT LOWER(SUBSTR(nume, 1, 2))||UPPER(SUBSTR(nume, 2)) as "nume", LENGTH(TRIM(nume)) AS "Lungime" FROM profesori WHERE UPPER(TRIM(nume)) LIKE 'B%'
/
SELECT nume, data_nastere, ADD_MONTHS(data_nastere, (TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12)+1)*12) AS "Urmatoarea zi nastere" FROM studenti
/
SELECT nume, data_nastere, ADD_MONTHS(data_nastere, (TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12)+1)*12) AS "Urmatoarea zi nastere", NEXT_DAY(ADD_MONTHS(data_nastere, (TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12)+1)*12), 'SUNDAY') FROM studenti
/
SELECT nume, prenume, TO_CHAR(data_nastere, 'Month') as "luna" FROM studenti WHERE bursa IS NULL ORDER BY TO_NUMBER(TO_CHAR(data_nastere, 'MM'))
/
SELECT nume, prenume, DECODE(bursa, 450, 'Premiul 1', 350, 'Premiul 2', 250, 'Premiul 3', 'Mentiune') as "Premiu" FROM studenti
/
SELECT TRANSLATE(nume, 'ai', 'ia') FROM studenti
/
SELECT nume, data_nastere, TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12) || ' ani ' || TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere) - TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12)*12) || ' luni ' || TO_CHAR(TRUNC(TO_NUMBER(MONTHS_BETWEEN(SYSDATE, data_nastere)/12*365) - TO_NUMBER(TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12)*365))) || ' zile' as "PLS" FROM studenti
/
SELECT nume, data_nastere, TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12) || ' ani ' || TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere) - TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12)*12) || ' luni ' || TO_CHAR(TRUNC(TO_NUMBER(MONTHS_BETWEEN(SYSDATE, data_nastere)/12*365) - TO_NUMBER(TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12)*365))) || ' zile' as "PLS", 365- TRUNC(TO_NUMBER(MONTHS_BETWEEN(SYSDATE, data_nastere)/12*365) - TO_NUMBER(TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12)*365))|| ' zile pana la urmatoarea zi de nastere' FROM studenti
/
SELECT nume, LAST_DAY(sysdate)+1, DECODE(bursa, 450, 110*450/100, 350, 350*115/100, 250, 250*120/100, 0) bursa_noua FROM studenti
/
