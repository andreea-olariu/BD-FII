1. Afișați numărul de studenți din fiecare an.
SELECT an, COUNT(*) FROM studenti GROUP BY an;
-- =============================
2. Afișați numărul de studenți din fiecare grupă a fiecărui an de studiu. Ordonați crescător după anul de studiu și după grupă.
SELECT an, grupa, COUNT(*) FROM studenti GROUP BY an, grupa ORDER BY an, grupa;
-- =============================
3. Afișați numărul de studenți din fiecare grupă a fiecărui an de studiu și specificați câți dintre aceștia sunt bursieri.
SELECT an, grupa, COUNT(*), COUNT(bursa) bursieri FROM studenti GROUP BY an, grupa ORDER BY an, grupa;
-- =============================
4. Afișați suma totală cheltuită de facultate pentru acordarea burselor.
SELECT SUM(NVL(bursa, 0)) FROM studenti;
-- =============================
5. Afișați valoarea bursei/cap de student (se consideră că studentii care nu sunt bursieri primesc 0 RON); altfel spus: cât se cheltuiește în medie pentru un student?
SELECT AVG(NVL(bursa,0)) venit FROM studenti;
-- =============================
6. Afișați numărul de note de fiecare fel (câte note de 10, câte de 9,etc.). Ordonați descrescător după valoarea notei.
SELECT valoare, COUNT(*) FROM note GROUP BY valoare ORDER BY valoare DESC;
-- =============================
7. Afișați numărul de note pus în fiecare zi a săptămânii. Ordonați descrescător după numărul de note.
SELECT TO_CHAR(data_notare, 'Day'), COUNT(*) FROM note GROUP BY TO_CHAR(data_notare, 'Day') ORDER BY COUNT(*) DESC;
-- =============================
8. Afișați numărul de note pus în fiecare zi a săptămânii. Ordonați crescător după ziua saptamanii: Sunday, Monday, etc.
SELECT TO_CHAR(data_notare, 'Day'), COUNT(*) FROM note GROUP BY TO_CHAR(data_notare, 'Day'), TO_CHAR(data_notare, 'D') ORDER BY TO_CHAR(data_notare, 'D');
-- =============================
9. Afișați pentru fiecare elev care are măcar o notă, numele și media notelor sale. Ordonați descrescător după valoarea mediei.
SELECT nume, AVG(valoare) FROM studenti NATURAL JOIN note GROUP BY nr_matricol, nume HAVING count(valoare)>0 ORDER BY AVG(valoare) DESC;
-- =============================
10. Modificați interogarea anterioară pentru a afișa și elevii fără nici o notă. Media acestora va fi null.
SELECT s.nume, NVL(AVG(n.valoare), NULL) FROM studenti s LEFT OUTER JOIN note n ON s.nr_matricol=n.nr_matricol GROUP BY n.nr_matricol, s.nume ORDER BY NVL(AVG(n.valoare),0) DESC;
-- =============================
11. Modificați interogarea anterioară pentru a afișa pentru elevii fără nici o notă media 0.
SELECT s.nume, NVL(AVG(n.valoare), 0) FROM studenti s LEFT OUTER JOIN note n ON s.nr_matricol=n.nr_matricol GROUP BY n.nr_matricol, s.nume ORDER BY NVL(AVG(n.valoare),0) DESC;
-- =============================
12. Modificati interogarea de mai sus pentru a afisa doar studentii cu media mai mare ca 8.
SELECT s.nume, AVG(n.valoare) FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol GROUP BY n.nr_matricol, s.nume HAVING AVG(n.valoare)>8 ORDER BY AVG(n.valoare) DESC;
-- =============================
13. Afișați numele, cea mai mare notă, cea mai mică notă și media doar pentru acei studenti care au primit doar note mai mari sau egale cu 7 (au cea mai mică notă mai mare sau egală cu 7).
SELECT s.nume, MAX(n.valoare), MIN(n.valoare), AVG(n.valoare) FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol GROUP BY n.nr_matricol, s.nume HAVING MIN(n.valoare)>=7;
-- =============================
14. Afișați numele și mediile studenților care au cel puțin un număr de 3 note puse în catalog.
SELECT s.nume, AVG(n.valoare), COUNT(n.valoare) FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol GROUP BY n.nr_matricol, s.nume HAVING COUNT(n.valoare) >= 3;
-- =============================
15. Afișați numele și mediile studenților care au cel puțin un număr de 3 note diferite puse în catalog.
SELECT s.nume, AVG(n.valoare), COUNT(DISTINCT n.valoare) FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol GROUP BY n.nr_matricol, s.nume HAVING COUNT(DISTINCT n.valoare) >= 3;
-- =============================
16. Afișați numele și mediile studenților din grupa A2 anul 3.
SELECT s.nume, s.an, s.grupa, AVG(n.valoare) FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol WHERE s.an=3 AND s.grupa='A2' GROUP BY s.nr_matricol, s.nume, s.an, s.grupa;
-- =============================
17. Afișați cea mai mare medie obținută de vreun student. Puteți să afișați și numărul matricol al studentului care are acea medie maximală ? Argumentați.
SELECT MAX(AVG(valoare)) FROM note GROUP BY nr_matricol;
-- =============================
18. Pentru fiecare disciplină de studiu afișati titlul acesteia, cea mai mică și cea mai mare notă pusă.
SELECT titlu_curs, MIN(valoare), MAX(valoare) FROM cursuri NATURAL JOIN note GROUP BY id_curs, titlu_curs;

















