SET autocommit=FALSE;
--SELECT CURDATE();
--SELECT CURTIME();
SELECT NOW();
SELECT user(), current_user();

--DROP DATABASE IF EXISTS llibres;

--SHOW VARIABLES;

USE llibres;

START TRANSACTION;

--SELECT %ltd% as entrada;

SET @var = 0;
SELECT * FROM autors;
SET @var = 0;
SELECT * FROM llibres;

SET @var = 0;
SELECT 	(@var:=@var+1) comptador, llibres.isbn, autors.nom, llibres.titol
FROM	autors, llibres
WHERE	autors.autorId = llibres.autorId
ORDER BY comptador;
--ORDER BY autors.nom DESC;

 
-- també es pot demanar amb una INNER JOIN
SELECT 	l.isbn, a.nom, l.titol
FROM llibres l
INNER JOIN autors a ON a.autorId = l.autorId
ORDER BY a.nom DESC;

-- també es pot demanar amb una INNER JOIN i amb capçalera
SELECT 	l.isbn ISBN, a.nom "NOM AUTOR", l.titol "TITOL LLIBRE"
FROM llibres l
INNER JOIN autors a ON a.autorId = l.autorId
ORDER BY a.nom DESC;

--ATENCIÓ!!!!!! MariaDB no suporta FULL OUTER JOIN !!!!!!
-- cal fer RIGHT i LEFT JOINS i fer UNION
SELECT * FROM autors a
LEFT JOIN llibres l ON a.autorId = l.autorId
UNION
SELECT * FROM autors a
RIGHT JOIN llibres l ON a.autorId = l.autorId;

SELECT 	l.isbn ISBN, a.nom "NOM AUTOR", l.titol "TITOL LLIBRE"
FROM llibres.llibres l
INNER JOIN llibres.autors a ON a.autorId = l.autorId
ORDER BY a.nom DESC;

--ATENCIÓ!!!!!! MariaDB no suporta FULL OUTER JOIN !!!!!!
-- cal fer RIGHT i LEFT JOINS i fer UNION
SELECT * FROM llibres.autors a
LEFT JOIN llibres.llibres l ON a.autorId = l.autorId
UNION
SELECT * FROM llibres.autors a
RIGHT JOIN llibres.llibres l ON a.autorId = l.autorId;



COMMIT;
