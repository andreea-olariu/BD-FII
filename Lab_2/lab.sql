SELECT * FROM studenti WHERE an>=ALL(1,2)
MINUS
SELECT * FROM studenti WHERE an=1
/
