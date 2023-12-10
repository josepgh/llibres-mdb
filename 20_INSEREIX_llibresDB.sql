SET autocommit=TRUE;
--SELECT CURDATE();
--SELECT CURTIME();
SELECT NOW();
SELECT user(), current_user();

USE llibres;

START TRANSACTION; -- PREVAL sobre el SET autocommit=TRUE del principi

-- INSERT INTO autors(autorId, nom) VALUES(, '');					
INSERT INTO autors(autorId, nom) VALUES(1, 'Fidel Castro');
INSERT INTO autors(autorId) VALUES(2);
INSERT INTO autors VALUES(3, 'Vladimir Nabokov');
INSERT INTO autors VALUES(5, 'Ramon Vinyes');
INSERT INTO autors VALUES(988, 'Sapastre');
--INSERT INTO autors VALUES(988, 'Sapastre 2');

SELECT * FROM autors;
UPDATE autors SET nom = 'Lenin' WHERE autorId = 2;
SELECT * FROM autors;

--INSERT INTO llibres(isbn, autorId, titol, descripcio) VALUES ('', ,'' , '');
INSERT INTO llibres(autorId, isbn, titol, descripcio) VALUES (1, '1-1978', 'Titol 1' , 'desc 1'); -- aquí convi d'ordre dels camps
INSERT INTO llibres(isbn, autorId, titol, descripcio) VALUES ('3-2021',2 ,'Titol 2' , 'desc 2');
INSERT INTO llibres(isbn, autorId, titol, descripcio) VALUES ('15-2017',3 ,'Titol 3' , 'desc 3');
INSERT INTO llibres VALUES ('16-2025',2 ,'Titol 4' , 'desc 4');
INSERT INTO llibres VALUES ('10-1943',5 ,'A la boca dels núvols' , 'Va anar a l''exili');

SELECT * FROM llibres;

COMMIT;
