SELECT s.nume, s.prenume, s.an, n.valoare FROM note n RIGHT JOIN studenti s ON s.nr_matricol=n.nr_matricol
/
SELECT nume, prenume, data_nastere, trunc(months_between(sysdate, data_nastere)/12) FROM studenti
/
SELECT nume, prenume, data_nastere, trunc(months_between(sysdate, data_nastere)/12) AS ani, mod(trunc(months_between(sysdate, data_nastere)), 12) AS luni, trunc(sysdate-add_months(data_nastere, trunc(months_between(sysdate, data_nastere)))) AS zile FROM studenti
/
SELECT nume, prenume, data_nastere, trunc(months_between(sysdate, data_nastere)/12) AS ani, mod(trunc(months_between(sysdate, data_nastere)), 12) AS luni, trunc(sysdate-add_months(data_nastere, trunc(months_between(sysdate, data_nastere)))) AS zile, add_months(data_nastere, 12+trunc(months_between(sysdate, data_nastere)/12)*12) as next_brth FROM studenti
/
SELECT s1.nume||'-'||s2.nume, TO_CHAR(data_nastere, 'DAY') FROM studenti s1 JOIN studenti s2 ON TO_CHAR(s1.data_nastere, 'D') = TO_CHAR(s2.data_nastere, 'D') and s2.nume < s1.nume OR (s1.nume=s2.nume AND s1.nr_matricol<s2.nr_matricol) ORDER BY TO_CHAR(s1.data_nastere, 'D'), s1.nume
/
SELECT s1.nume,s2.nume,s2.data_nastere-s1.data_nastere FROM studenti s1 JOIN studenti s2 WHERE s1.data_nastere < s2.data_nastere ORDER BY s2.data_nastere-s1.data_nastere
/
