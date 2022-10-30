SELECT s.nume, s.prenume, c.titlu_curs, valoare, p.nume, p.prenume FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON n.id_curs=c.id_curs JOIN didactic d ON c.id_curs=d.id_curs JOIN profesori p ON p.id_prof=d.id_prof
/
SELECT studenti.nume, studenti.prenume, cursuri.titlu_curs, note.valoare FROM studenti JOIN note on studenti.nr_matricol=note.nr_matricol JOIN cursuri on note.id_curs=cursuri.id_curs WHERE cursuri.titlu_curs='BD' AND note.valoare=10
/
SELECT profesori.nume, profesori.prenume, cursuri.titlu_curs FROM profesori JOIN didactic ON profesori.id_prof=didactic.id_prof JOIN cursuri ON cursuri.id_curs=didactic.id_curs
/
SELECT profesori.nume, profesori.prenume, cursuri.titlu_curs FROM profesori LEFT OUTER JOIN didactic ON profesori.id_prof=didactic.id_prof LEFT OUTER JOIN cursuri ON cursuri.id_curs=didactic.id_curs
/
SELECT profesori.nume, profesori.prenume, cursuri.titlu_curs FROM profesori JOIN didactic ON profesori.id_prof=didactic.id_prof RIGHT OUTER JOIN cursuri ON cursuri.id_curs=didactic.id_curs
/
SELECT s1.nume||' '||s1.prenume||' a luat nota mai mare decat '||s2.nume|| ' ' || s2.prenume, s1.prenume, s2.prenume, n1.valoare, n2.valoare AS "PLS" FROM studenti s1 JOIN note n1 ON n1.nr_matricol=s1.nr_matricol JOIN (studenti s2 JOIN note n2 ON n2.nr_matricol=s2.nr_matricol) ON n1.valoare>n2.valoare AND n1.id_curs=n2.id_curs
/
SELECT s.nume, s.prenume, p.nume, p.prenume FROM studenti s JOIN profesori p ON LENGTH(TRIM(s.nume))=LENGTH(TRIM(p.nume))
/
SELECT * FROM cursuri JOIN note ON cursuri.id_curs = note.id_curs AND note.valoare <= 8
/
SELECT LOWER(TO_CHAR(note.data_notare, 'DAY')) FROM studenti JOIN note ON note.nr_matricol=studenti.nr_matricol JOIN cursuri ON ((cursuri.id_curs=note.id_curs AND cursuri.titlu_curs='OOP') AND (note.valoare=7 OR note.valoare=10)) WHERE LOWER(TO_CHAR(note.data_notare, 'DAY')) = 'tuesday'
/
SELECT s1.nume, s2.nume, TO_CHAR(s1.data_nastere, 'DAY') FROM studenti s1 JOIN studenti s2 ON TO_CHAR(s1.data_nastere, 'DAY')=TO_CHAR(s2.data_nastere, 'DAY') WHERE s1.nume<s2.nume ORDER by TO_CHAR(s1.data_nastere, 'D')
/
SELECT s.nume, s.prenume, c.titlu_curs, n.valoare, TO_CHAR(n.data_notare, 'MON-YYYY'), (SELECT '+' FROM DUAL WHERE TO_CHAR(LAST_DAY(n.data_notare), 'DD')<='29') FROM studenti s JOIN note n ON s.nr_matricol=n.nr_matricol JOIN cursuri c ON c.id_curs=n.id_curs WHERE n.valoare>5
/
