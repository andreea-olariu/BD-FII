/*
Afișați numărul de studenți din fiecare an.
Afișați numărul de studenți din fiecare grupă a fiecărui an de studiu. Ordonați crescător după anul de studiu și după grupă.
Afișați numărul de studenți din fiecare grupă a fiecărui an de studiu și specificați câți dintre aceștia sunt bursieri.
Afișați suma totală cheltuită de facultate pentru acordarea burselor.
Afișați valoarea bursei/cap de student (se consideră că studentii care nu sunt bursieri primesc 0 RON); altfel spus: cât se cheltuiește în medie pentru un student?
Afișați numărul de note de fiecare fel (câte note de 10, câte de 9,etc.). Ordonați descrescător după valoarea notei.
Afișați numărul de note pus în fiecare zi a săptămânii. Ordonați descrescător după numărul de note.
Afișați numărul de note pus în fiecare zi a săptămânii. Ordonați crescător după ziua saptamanii: Sunday, Monday, etc.
Afișați pentru fiecare elev care are măcar o notă, numele și media notelor sale. Ordonați descrescător după valoarea mediei.
Modificați interogarea anterioară pentru a afișa și elevii fără nici o notă. Media acestora va fi null.
Modificați interogarea anterioară pentru a afișa pentru elevii fără nici o notă media 0.
Modificati interogarea de mai sus pentru a afisa doar studentii cu media mai mare ca 8.
Afișați numele, cea mai mare notă, cea mai mică notă și media doar pentru acei studenti care au primit doar note mai mari sau egale cu 7 (au cea mai mică notă mai mare sau egală cu 7).
Afișați numele și mediile studenților care au cel puțin un număr de 3 note puse în catalog.
Afișați numele și mediile studenților care au cel puțin un număr de 3 note diferite puse în catalog.
Afișați numele și mediile studenților din grupa A2 anul 3.
Afișați cea mai mare medie obținută de vreun student. Puteți să afișați și numărul matricol al studentului care are acea medie maximală ? Argumentați.
Pentru fiecare disciplină de studiu afișati titlul acesteia, cea mai mică și cea mai mare notă pusă.
*/


SELECT an, COUNT(*) FROM studenti GROUP BY an;

SELECT an, grupa, COUNT(*) FROM studenti GROUP BY an, grupa ORDER BY an, grupa;

SELECT an, grupa, COUNT(bursa) FROM studenti WHERE bursa>0 GROUP BY an, grupa;

SELECT SUM(NVL(bursa, 0)) FROM studenti;

SELECT AVG(NVL(bursa, 0)) FROM studenti;

SELECT valoare,COUNT(*) FROM note GROUP BY valoare  ORDER BY valoare DESC;

SELECT TO_CHAR(data_notare, 'DAY'), COUNT(*) FROM note 
GROUP BY TO_CHAR(data_notare, 'DAY') ORDER BY COUNT(*) DESC;

SELECT TO_CHAR(data_notare, 'DAY'), COUNT(valoare) FROM note 
GROUP BY TO_CHAR(data_notare, 'D'), TO_CHAR(data_notare, 'DAY') 
ORDER BY TO_CHAR(data_notare, 'D');

SELECT DISTINCT s.nume, TRUNC(AVG(n.valoare), 2) FROM studenti s 
LEFT OUTER JOIN note n ON s.nr_matricol=n.nr_matricol 
GROUP BY s.nr_matricol, s.nume 
HAVING COUNT(n.valoare)>0;

SELECT DISTINCT s.nume, TRUNC(AVG(NVL(n.valoare, 
NULL)), 2) FROM studenti s 
LEFT OUTER JOIN note n ON s.nr_matricol=n.nr_matricol 
GROUP BY s.nr_matricol, s.nume;

SELECT DISTINCT s.nume, TRUNC(AVG(NVL(n.valoare, 0)), 
2) FROM studenti s 
LEFT OUTER JOIN note n ON s.nr_matricol=n.nr_matricol 
GROUP BY s.nr_matricol, s.nume;

SELECT DISTINCT s.nume, TRUNC(AVG(NVL(n.valoare, 0)), 
2) FROM studenti s 
LEFT OUTER JOIN note n ON s.nr_matricol=n.nr_matricol 
GROUP BY s.nr_matricol, s.nume
HAVING AVG(n.valoare)>8;

SELECT s.nume, MIN(n.valoare), MAX(n.valoare), 
AVG(n.valoare) FROM studenti s JOIN note n ON 
s.nr_matricol=n.nr_matricol
GROUP BY s.nr_matricol, s.nume
HAVING MAX(n.valoare) >= 7;


SELECT s.nume, AVG(n.valoare), COUNT(n.valoare) FROM 
studenti s JOIN note n ON s.nr_matricol=n.nr_matricol
GROUP BY s.nr_matricol, s.nume
HAVING COUNT(n.valoare) >= 3;

SELECT s.nume, AVG(n.valoare), COUNT(n.valoare) FROM 
studenti s JOIN note n ON s.nr_matricol=n.nr_matricol
GROUP BY s.nr_matricol, s.nume
HAVING COUNT(DISTINCT n.valoare) >= 3;

SELECT an, grupa, AVG(n.valoare) FROM studenti s JOIN 
note n ON s.nr_matricol=n.nr_matricol GROUP BY s.an, 
s.grupa
HAVING s.an=3 AND s.grupa='A2';

SELECT MAX(AVG(valoare)) FROM studenti s NATURAL JOIN 
note n GROUP BY nr_matricol;

SELECT titlu_curs, MIN(valoare), MAX(valoare)  FROM 
note NATURAL JOIN cursuri GROUP BY id_curs, 
titlu_curs;

