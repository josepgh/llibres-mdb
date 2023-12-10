SET autocommit=FALSE;

SELECT NOW();
SELECT user(), current_user();

START TRANSACTION;

INSERT INTO autors VALUES(13, 'Thomas Mann');
INSERT INTO autors VALUES(18, 'Dylan Thomas');

INSERT INTO llibres(isbn, autorId, titol, descripcio) VALUES ('11-1979',13 ,'Mort a Venècia' , 'Premi Nòbel');
INSERT INTO llibres(isbn, autorId, titol, descripcio) VALUES ('13-2022',18 ,'Collected Stories' , 'Escriptor gal·les');

SELECT * FROM autors;
SELECT * FROM llibres;

COMMIT;
