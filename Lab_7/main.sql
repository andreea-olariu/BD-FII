1. Afișați numele studenților care iau cea mai mare bursa acordată.
SELECT nume, bursa FROM studenti WHERE bursa = (SELECT MAX(bursa) FROM studenti);
-- =====================================
2. Afișați numele studenților care sunt colegi cu un student pe nume Arhire (coleg = același an si aceeași grupă).
SELECT nume FROM studenti WHERE (an, grupa) in (SELECT an, grupa FROM studenti WHERE nume='Arhire') AND nume != 'Arhire';
-- =====================================
3. Pentru fiecare grupă afișați numele studenților care au obținut cea mai mică notă la nivelul grupei.
SELECT DISTINCT an, grupa, nume FROM studenti NATURAL JOIN note WHERE valoare in (SELECT MIN(valoare) FROM note GROUP BY an, grupa);
-- =====================================
4. Identificați studenții a căror medie este mai mare decât media tuturor notelor din baza de date. Afișați numele și media acestora.
SELECT nume, prenume FROM studenti NATURAL JOIN note GROUP BY nr_matricol, nume, prenume HAVING AVG(valoare)>(SELECT AVG(valoare) FROM note);
-- =====================================
5. Afișați numele și media primilor trei studenți ordonați descrescător după medie.
SELECT * FROM (SELECT nume, AVG(valoare) FROM studenti NATURAL JOIN note GROUP BY nr_matricol, nume ORDER BY AVG(valoare) DESC) WHERE ROWNUM < 4;
-- =====================================
6. Afișați numele studentului (studenților) cu cea mai mare medie precum și valoarea mediei (atenție: limitarea numărului de linii poate elimina studenții de pe poziții egale; găsiți altă soluție).
SELECT nume, AVG(valoare) FROM studenti NATURAL JOIN note GROUP BY nr_matricol, nume HAVING AVG(valoare) IN (SELECT MAX(AVG(valoare)) FROM note GROUP BY nr_matricol);
-- =====================================
7. Afişaţi numele şi prenumele tuturor studenţilor care au luat aceeaşi nota ca şi Ciprian Ciobotariu la materia Logică. Excludeţi-l pe acesta din listă. (Se știe în mod cert că există un singur Ciprian Ciobotariu și că acesta are o singură notă la logică)
SELECT nume, prenume FROM note NATURAL JOIN cursuri LEFT JOIN studenti ON note.nr_matricol=studenti.nr_matricol WHERE titlu_curs='Logica' and valoare = (SELECT valoare FROM note n NATURAL JOIN cursuri c LEFT JOIN studenti s ON s.nr_matricol=n.nr_matricol WHERE titlu_curs='Logica' AND s.nume='Ciobotariu' AND s.prenume='Ciprian') AND nume!='Ciobotariu' AND prenume != 'Ciprian';
-- =====================================
8. Din tabela studenti, afisati al cincilea prenume in ordine alfabetica.
SELECT * FROM (SELECT * FROM (SELECT DISTINCT prenume FROM studenti ORDER BY prenume) WHERE rownum <= 5 ORDER BY rownum DESC) WHERE rownum=1;
-- =====================================
9. Punctajul unui student se calculeaza ca fiind o suma intre produsul dintre notele luate si creditele la materiile la care au fost luate notele. Afisati toate informatiile studentului care este pe locul 3 in acest top.
SELECT * FROM (SELECT * FROM (SELECT nume, prenume, SUM(n.valoare*c.credite) FROM studenti s NATURAL JOIN note n JOIN cursuri c on n.id_curs=c.id_curs GROUP BY nr_matricol, nume, prenume ORDER BY SUM(n.valoare*c.credite) DESC) WHERE rownum<=3 ORDER BY rownum DESC) WHERE rownum=1;
-- =====================================
10. Afișați studenții care au notă maximă la o materie precum și nota și materia respectivă.
 SELECT nume, prenume, titlu_curs, valoare FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c on c.id_curs=n.id_curs WHERE (n.id_curs, n.valoare) IN (SELECT id_curs, MAX(valoare) FROM note GROUP BY id_curs);


-- exercitii la laborator

SELECT nume, prenume FROM studenti WHERE nr_matricol 
IN (
SELECT nr_matricol FROM note n 
WHERE valoare=10 AND n.id_curs IN 
(SELECT id_curs FROM cursuri WHERE titlu_curs='BD'));

SELECT * FROM (SELECT nume, prenume FROM studenti);

SELECT * FROM studenti WHERE (an, grupa) IN (SELECT 
an, grupa FROM studenti WHERE bursa IS NOT NULL);

SELECT COUNT(*), COUNT(bursa), an, grupa FROM studenti 
GROUP BY an, grupa HAVING (an, grupa) IN (SELECT an, 
grupa FROM studenti WHERE bursa IS NOT NULL);

SELECT TRUNC(AVG(valoare), 2) medie, s.nr_matricol, 
s.an, s.grupa, s.nume, s.prenume FROM studenti s 
JOIN note n ON s.nr_matricol=n.nr_matricol GROUP BY 
s.nr_matricol, s.an, s.grupa, s.nume, s.prenume HAVING 
(TRUNC(AVG(valoare), 2), an, grupa) IN
(SELECT MAX(medie), an, grupa FROM (SELECT 
TRUNC(AVG(valoare), 2) medie, s.nr_matricol, s.an, 
s.grupa FROM studenti s 
JOIN note n ON s.nr_matricol=n.nr_matricol GROUP BY 
s.nr_matricol, s.an, s.grupa) GROUP BY an, grupa);

SELECT nume, prenume FROM studenti WHERE rownum<4;










