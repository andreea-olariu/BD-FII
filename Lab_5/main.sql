SELECT an, COUNT(*) FROM studenti GROUP BY an;
SELECT an, grupa, COUNT(*) FROM studenti GROUP BY an, 
grupa ORDER BY an, grupa;
SELECT an, grupa, COUNT(bursa) FROM studenti WHERE 
bursa>0 GROUP BY an, grupa;
SELECT SUM(NVL(bursa, 0)) FROM studenti;
SELECT AVG(NVL(bursa, 0)) FROM studenti;
SELECT valoare,COUNT(*) FROM note GROUP BY valoare 
ORDER BY valoare DESC;
SELECT TO_CHAR(data_notare, 'DAY'), COUNT(*) FROM note 
GROUP BY TO_CHAR(data_notare, 'DAY') ORDER BY COUNT(*) 
DESC;
SELECT TO_CHAR(data_notare, 'DAY'), COUNT(valoare) 
FROM note GROUP BY TO_CHAR(data_notare, 'D'), 
TO_CHAR(data_notare, 'DAY') ORDER BY 
TO_CHAR(data_notare, 'D');

SELECT DISTINCT s.nume, TRUNC(AVG(n.valoare), 2) FROM 
studenti s 
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

