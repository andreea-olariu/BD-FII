1. Cum poate fi utilizată o secvență la inserare? Răspundeți creând o secvență care sa vă ajute sa inserați noi cursuri cu id unic, cu intrari consecutive crescătoare cu pasul 1. Inserati 3 cursuri noi cu id-ul generat de secventa.
CREATE SEQUENCE s1 INCREMENT BY 1 START WITH 30 MAXVALUE 33;
INSERT INTO cursuri VALUES(s1.NEXTVAL, 'AIIT', 2, 2, 6);
-- ==============
17. Actualizati valoarea bursei pentru studentii care au măcar o notă de 10. Acestia vor primi ca bursa 500RON.
UPDATE studenti s SET s.bursa=500 WHERE EXISTS (SELECT '-' FROM note n WHERE valoare=10 AND n.nr_matricol=s.nr_matricol);
-- ==============
18. Toti studentii primesc o bursa egala cu 100*media notelor lor. Efectuati modificarile necesare.
UPDATE studenti s SET bursa = 100 * (SELECT AVG(valoare) FROM note GROUP BY nr_matricol HAVING nr_matricol=s.nr_matricol);
-- ==============
2. Stergeti toti studentii care nu au nici o nota.
DELETE FROM studenti s WHERE NOT EXISTS (SELECT '-' FROM note n WHERE n.nr_matricol=s.nr_matricol);
-- ==============
3. Executati comanda ROLLBACK. Creati apoi o tabelă care să stocheze numele, prenumele, bursa si mediile studentilor.
CREATE TABLE new (nume, prenume, bursa, medie) AS (SELECT nume, prenume, bursa, AVG(valoare) FROM studenti NATURAL JOIN note GROUP BY nr_matricol, nume, prenume, bursa);
-- ==============
4. Adăugați constrângerile de tip cheie primară pentru tabelele Studenti, Profesori, Cursuri.
5. Adăugați constrângerile referențiale pentru tabelele Note și Didactic. La ștergerea unui profesor din tabela Profesori, în tabela Didactic id-ul profesorului șters va deveni null. La stergerea unui curs din tabela Cursuri, in tabela Didactic va fi stearsă înregistrarea care referențiază cursul șters. Scrieți comenzi de ștergere înregistrări pentru tabelele referențiate și studiați comportamentul.
6. Impuneți constrângerea ca un student să nu aibă mai mult de o notă la un curs.
7. Impuneți constrângerea ca valoarea notei să fie cuprinsă între 1 și 10.
ALTER TABLE note ADD CONSTRAINT limite CHECK (valoare>0 AND valoare<=10);
8. Asigurati-va că începeți o nouă tranzacție.
9. Ștergeți toate înregistrările din tabela Profesori.
10. Inserați un profesor.
11. Marcați starea curentă ca 's1'.
12. Schimbați numele profesorului inserat.
13. Vizualizați datele.
14. Reveniți la starea s1.
15. Vizualizați datele.
16. Reveniția la starea de dinaintea ștergerii.