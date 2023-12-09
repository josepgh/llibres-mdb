--SET GLOBAL log_output='FILE';
-- la sortid no serveix per res !!!!!!!!!!!;
--SET GLOBAL general_log_file='C:\\Users\\josep\\OneDrive\\PRJCTS\\llibresDB_MariaDB\\log_tonto_crea_llibresDB+USUARIS.txt';

SET autocommit=FALSE;
--SELECT CURDATE();
--SELECT CURTIME();
SELECT NOW();
SELECT user(), current_user();

DROP DATABASE IF EXISTS llibres;
DROP USER IF EXISTS llibreter@localhost;
DROP USER IF EXISTS guillem@localhost;

START TRANSACTION;
-- -----------------------------------------------------------------------------------------------------
--                                      CREA BASE DADES
-- -----------------------------------------------------------------------------------------------------

--DROP DATABASE IF EXISTS llibres;

CREATE DATABASE llibres;

USE llibres;

CREATE TABLE autors(
					autorId INTEGER PRIMARY KEY, 
					nom VARCHAR(50)
					);

CREATE TABLE llibres(
					isbn char(20) primary key,
					autorId INTEGER,
					titol 	VARCHAR(50),
					descripcio text
--					, CONSTRAINT `fk_llibres_autorId` FOREIGN KEY (autorId) REFERENCES autors(autorId)
					);
					
ALTER TABLE llibres ADD CONSTRAINT `fk_llibres_autorId` FOREIGN KEY (autorId) REFERENCES autors(autorId);

-- -----------------------------------------------------------------------------------------------------
--                                      CREA USUARIS
-- -----------------------------------------------------------------------------------------------------

--DROP USER IF EXISTS llibreter@localhost;

CREATE OR REPLACE USER llibreter@localhost IDENTIFIED BY 'llibreter' PASSWORD EXPIRE NEVER;
GRANT ALL PRIVILEGES ON llibres.* TO 'llibreter'@'localhost';
FLUSH PRIVILEGES;

CREATE OR REPLACE USER guillem@localhost IDENTIFIED BY 'guillem' PASSWORD EXPIRE NEVER;
GRANT ALL PRIVILEGES ON llibres.* TO 'guillem'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;



/*
--DROP USER IF EXISTS guillem@192.168.1.41;
DROP USER IF EXISTS guillem@localhost;
--CREATE OR REPLACE USER guillem@192.168.1.41 IDENTIFIED BY 'guillem' PASSWORD EXPIRE NEVER;
CREATE OR REPLACE USER guillem@localhost IDENTIFIED BY 'guillem' PASSWORD EXPIRE NEVER;

--GRANT ALL PRIVILEGES ON llibres.* TO 'guillem'@'192.168.1.41';
--GRANT SELECT ON llibres.* TO 'guillem'@'localhost' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON llibres.* TO 'guillem'@'localhost' WITH GRANT OPTION;

FLUSH PRIVILEGES;

--SHOW GRANTS FOR guillem@192.168.1.41;
SHOW GRANTS FOR guillem@localhost;
*/

SHOW GRANTS FOR llibreter@localhost;


SELECT user FROM mysql.user; -- ok

COMMIT;

--SET SESSION SQL_LOG_OFF=1;
