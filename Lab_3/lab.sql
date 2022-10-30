SELECT CURRENT_DATE AS "Astazi" FROM DUAL
/
SELECT nume, prenume, data_nastere, TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)) FROM studenti
/
SELECT nume, prenume, TO_CHAR(data_nastere,'day') FROM studenti
/
SELECT CONCAT('Elevul ',CONCAT(prenume, CONCAT(' este in grupa ', grupa))) AS "info" FROM studenti
/
SELECT nume, prenume, RPAD(bursa, 10, '$') AS bursa FROM studenti
/
SELECT CONCAT(LOWER(SUBSTR(TRIM(nume), 1, 1)), UPPER(SUBSTR(TRIM(NUME), 2))), LENGTH(TRIM(nume)) FROM profesori WHERE nume LIKE 'B%'
/
SELECT nume, prenume, data_nastere, ADD_MONTHS(data_nastere, TRUNC(MONTHS_BETWEEN(SYSDATE, data_nastere)/12+1)*12) FROM studenti
/
SELECT nume, prenume, TO_CHAR(data_nastere, 'month') FROM studenti WHERE bursa is NULL ORDER BY TO_CHAR(data_nastere, 'month')
/
