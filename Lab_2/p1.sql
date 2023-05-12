-- Scrieți o interogare pentru a afișa numele, prenumele, anul de studiu si data nașterii pentru toți studenții. Editați în SQL*Plus și executați. Salvați apoi interogarea intr-un fișier numit p1.sql

SELECT nume || ' ' || prenume || ' ' || an || ' ' || data_nastere as info FROM studenti
/
