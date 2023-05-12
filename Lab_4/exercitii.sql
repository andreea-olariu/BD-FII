/*
Afişaţi studenţii şi notele pe care le-au luat si profesorii care le-au pus acele note.
Afisati studenţii care au luat nota 10 la materia 'BD'. Singurele valori pe care aveţi voie să le hardcodaţi în interogare sunt valoarea notei (10) şi numele cursului ('BD').
Afisaţi profesorii (numele şi prenumele) impreuna cu cursurile pe care fiecare le ţine.
Modificaţi interogarea de la punctul 3 pentru a fi afişaţi şi acei profesori care nu au încă alocat un curs.
Modificaţi interogarea de la punctul 3 pentru a fi afişate acele cursuri ce nu au alocate încă un profesor.
Modificaţi interogarea de la punctul 3 astfel încât să fie afişaţi atat profesorii care nu au nici un curs alocat cât şi cursurile care nu sunt încă predate de nici un profesor.
In tabela studenti există studenţi care s-au nascut în aceeasi zi a săptămânii. De exemplu, Cobzaru George şi Pintescu Andrei s-au născut amândoi într-o zi de marti. Construiti o listă cu studentii care s-au născut in aceeaşi zi grupându-i doi câte doi în ordine alfabetică a numelor (de exemplu in rezultat va apare combinatia Cobzaru-Pintescu dar nu va apare şi Pintescu-Cobzaru). Lista va trebui să conţină doar numele de familie a celor doi împreună cu ziua în care cei doi s-au născut. Evident, dacă există şi alţi studenti care s-au născut marti, vor apare si ei in combinatie cu cei doi amintiţi mai sus. Lista va fi ordonată în funcţie de ziua săptămânii în care s-au născut si, în cazul în care sunt mai mult de trei studenţi născuţi în aceeaşi zi, rezultatele vor fi ordonate şi după numele primei persoane din listă .
Sa se afiseze, pentru fiecare student, numele colegilor care au luat nota mai mare ca ei la fiecare dintre cursuri. Formulati rezultatele ca propozitii (de forma "Popescu Gigel a luat nota mai mare ca Vasilescu Ionel la matera BD."). Dati un nume corespunzator coloanei [pont: interogarea trebuie să returneze 118 rânduri].
Afisati studentii doi cate doi impreuna cu diferenta de varsta dintre ei. Sortati in ordine crescatoare in functie de aceste diferente. Aveti grija sa nu comparati un student cu el insusi.
Afisati posibilele prietenii dintre studenti si profesori. Un profesor si un student se pot imprieteni daca numele lor de familie are acelasi numar de litere.
Afisati denumirile cursurilor la care s-au pus note cel mult egale cu 8 (<=8).
Afisati numele studentilor care au toate notele mai mari ca 7 sau egale cu 7.
Sa se afiseze studentii care au luat nota 7 sau nota 10 la OOP intr-o zi de marti.
O sesiune este identificata prin luna si anul in care a fost tinuta. Scrieti numele si prenumele studentilor ce au promovat o anumita materie, cu notele luate de acestia si sesiunea in care a fost promovata materia. Formatul ce identifica sesiunea este "LUNA, AN", fara alte spatii suplimentare (De ex. "JUNE, 2015" sau "FEBRUARY, 2014"). In cazul in care luna in care s-a tinut sesiunea a avut mai putin de 30 de zile afisati simbolul "+" pe o coloana suplimentara, indicand faptul ca acea sesiune a fost mai grea (avand mai putine zile), in caz contrar (cand luna are mai mult de 29 de zile) valoarea coloanei va fi null.
*/

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
