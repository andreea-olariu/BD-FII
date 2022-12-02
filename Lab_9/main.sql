1. Afişaţi toţi studenţii care au în an cu ei măcar un coleg care să fie mai 
mare ca ei (vezi data naşterii). 
Atentie, un student s1 este mai mare daca are data_nastere mai mica decat 
celalat student s2.
SELECT * FROM studenti s1 
WHERE EXISTS 
(SELECT '-' FROM studenti s2 WHERE s1.an=s2.an AND 
s1.data_nastere>s2.data_nastere);
-- ===================================================
2. Afişaţi toţi studenţii care au media mai mare decât media tuturor notelor 
colegilor din an cu ei. 
Pentru aceştia afişaţi numele, prenumele şi media lor.
SELECT nr_matricol, AVG(n1.valoare) FROM note n1 NATURAL JOIN studenti s1 GROUP 
BY nr_matricol, s1.an
HAVING AVG(n1.valoare) > ( SELECT AVG(n2.valoare) FROM note n2 NATURAL JOIN 
studenti s2 WHERE s2.an=s1.an GROUP BY s2.an );
-- ====================================================
3. Afişaţi numele, prenumele si grupa celui mai bun student din fiecare grupa în 
parte.

SELECT s1.nume, s1.prenume, s1.grupa, s1.an, AVG(n1.valoare) FROM studenti s1 
NATURAL JOIN note n1
GROUP BY nr_matricol, s1.nume, s1.prenume, s1.grupa, s1.an
HAVING AVG(n1.valoare) = (SELECT MAX(AVG(n2.valoare)) FROM studenti s2 NATURAL 
JOIN note n2 
WHERE s2.an=s1.an AND s2.grupa=s1.grupa 
GROUP BY nr_matricol);
-- ====================================================
4. Găsiţi toţi studenţii care au măcar un coleg în acelaşi an care să fi luat 
aceeaşi nota ca şi el la măcar o materie.

SELECT nume, prenume FROM studenti s1
WHERE EXISTS
(SELECT '-' FROM studenti s2 JOIN note n2 ON s2.nr_matricol=s1.nr_matricol WHERE 
(valoare, id_curs)
IN (SELECT valoare, id_curs FROM studenti s3 NATURAL JOIN note n3 WHERE 
nr_matricol=s1.nr_matricol));
-- ====================================================
5. Afișați toți studenții care sunt singuri în grupă (nu au alți colegi în 
aceeași grupă).

SELECT * FROM studenti s1 
WHERE NOT EXISTS 
(SELECT '-' FROM studenti s2 WHERE s2.an=s1.an AND s2.grupa=s1.grupa AND 
s2.nr_matricol!=s1.nr_matricol);
-- ====================================================
6. Afișați profesorii care au măcar un coleg (profesor) ce are media notelor 
puse la fel ca și el.

SELECT * FROM profesori;
SELECT * FROM didactic;
SELECT * FROM note;

SELECT p1.nume, AVG(n1.valoare) FROM profesori p1 JOIN didactic d1 ON 
d1.id_prof=p1.id_prof JOIN note n1 ON n1.id_curs=d1.id_curs WHERE
EXISTS 
(
SELECT '-' FROM profesori p2 JOIN didactic d ON p2.id_prof=d.id_prof JOIN note n 
ON n.id_curs=d.id_curs 
WHERE p2.id_prof!=p1.id_prof
HAVING AVG(n.valoare) IN (SELECT AVG(valoare) FROM profesori NATURAL JOIN 
didactic NATURAL JOIN note WHERE id_prof=p1.id_prof GROUP BY id_prof)
GROUP BY p2.id_prof
)
GROUP BY p1.id_prof, p1.nume;
-- ====================================================
7. Fara a folosi join, afisati numele si media fiecarui student.

SELECT nume, (SELECT AVG(valoare) from note n WHERE s.nr_matricol=n.nr_matricol 
GROUP BY nr_matricol) medie FROM studenti s ;
-- ====================================================
8. Afisati cursurile care au cel mai mare numar de credite din fiecare an (pot 
exista si mai multe pe an). 
- Rezolvati acest exercitiu si corelat si necorelat (se poate in ambele moduri). 
Care varianta este mai eficienta ?

SELECT * FROM cursuri 
WHERE cursuri.credite=(SELECT MAX(c.credite) FROM cursuri c WHERE cursuri.an=c.an);







