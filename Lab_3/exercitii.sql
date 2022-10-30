SELECT CURRENT_DATE "Astazi" FROM DUAL
/
                                                                                                                                    SELECT nume, prenume, MONTHS_BETWEEN(sysdate, data_nastere) FROM studenti
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
