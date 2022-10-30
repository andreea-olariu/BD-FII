DROP TABLE studenti;
DROP TABLE cursuri;
DROP TABLE note;
DROP TABLE profesori;
DROP TABLE didactic;

CREATE TABLE studenti (
        nr_matricol CHAR(6) NOT NULL, 
        nume VARCHAR2(10) NOT NULL,
        prenume VARCHAR2(10),
        an NUMBER(1),
        grupa CHAR(2),
        bursa NUMBER(6, 2),
        data_nastere DATE
        );
        
        
CREATE TABLE cursuri(
        id_curs CHAR(4) NOT NULL,
        titlu_curs VARCHAR2(10) NOT NULL,
        an NUMBER(1),
        semestru NUMBER(1),
        credite NUMBER(2)
        );
        
CREATE TABLE note(
        nr_matricol CHAR(6) NOT NULL,
        id_curs CHAR(4) NOT NULL,
        valoare NUMBER(2), 
        data_notare DATE
        );

CREATE TABLE profesori(
        id_prof CHAR(4) NOT NULL,
        nume CHAR(10) NOT NULL,
        prenume CHAR(10),
        grad_didactic VARCHAR2(5)
        );

CREATE TABLE didactic(
        id_prof CHAR(4) NOT NULL,
        id_curs CHAR(4) NOT NULL
        );

INSERT INTO studenti VALUES('PI', 'Popescu', 'Ionut', 2, '', '', '');
INSERT INTO cursuri VALUES('Logi', 'Logica', 1, 1, 6);
INSERT INTO note VALUES('PI', 'Logi', 10, NULL);
INSERT INTO profesori VALUES('CM', 'Masalagiu', 'Cristian', 1);
INSERT INTO didactic VALUES('CM', 'Logi');

SELECT table_name FROM user_tables;

SELECT * FROM studenti;
SELECT * FROM cursuri;
SELECT * FROM profesori;
SELECT * FROM didactic;
