rem @ECHO OFF


REM del projecte d'oracle D:\PRJCTS_ANTICS_PER_REVISAR\___PRJCTS 2022.09.22 COPIA\__PRJ_ORACLE\INE PETICIONS (TFG) ORACLE\SQL\07_OMPLE_BD
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
SET ldt=%ldt:~0,4%_%ldt:~4,2%_%ldt:~6,2%-%ldt:~8,2%_%ldt:~10,2%_%ldt:~12,2%


REM a la crida: sqlplus ine_3_01/ine_3_01@//localhost:1521/ine @07_omple_BD.sql %ldt%
REM al fitxer SQL: SPOOL C:\UOC\WSPACES\INE\..WS_INE_SQL_LOG\3_01\LOG_07_omple_BD_'&1'.log

REM https://stackoverflow.com/questions/9908462/mysql-script-with-parameters -------------------------------------
REM passed_var1=$1
REM passed_var2=$2
REM mainsql=script.sql
REM 
REM mysql $(usual_parameters) -e "set @user_var1=$passed_var1; set @user_var2=$passed_var2; source $mainsql"
REM --------------------------------------------------------------------------------------------------------------

set ldt

rem mariadb --host=localhost --user=root --password=root --database=mysql --verbose < 5_SELECTS_llibresDB.sql > log_5_SELECTS_llibresDB.log


rem passed_var1=$1
rem passed_var1=%ldt%
rem SET mainsql=5_SELECTS_llibresDB.sql
rem SET mainsql=5_SELECTS_llibresDB.sql

rem mariadb --host=localhost --user=root --password=mariadb --database=mysql --verbose -e "set @user_var1=%ldt%; source $mainsql" > log_5_SELECTS_llibresDB.log
rem okojojokokok mariadb --host=localhost --user=root --password=mariadb --database=mysql --verbose -e "set @user_var1='%ldt%'" < 5_SELECTS_llibresDB.sql > log_5_SELECTS_llibresDB.log


rem mariadb --host=localhost --user=root --password=root --database=mysql --verbose -e "set @user_var1='%ldt%'" < 5_SELECTS_llibresDB.sql > log_5_SELECTS_llibresDB_%ldt%.log


rem mariadb --host=localhost --user=root --password=root --database=mysql --verbose -e "set @user_var1='%ldt%'; source '%mainsql%'" > log_5_SELECTS_llibresDB_%ldt%.log

rem mariadb --host=localhost --user=root --password=root --database=mysql --verbose  < 5_SELECTS_llibresDB_%ldt%.sql


mariadb --host=localhost --user=root --password=root --database=mysql --verbose  < 40_SELECTS_llibresDB.sql > log_40_SELECTS_llibresDB_%ldt%.log


rem pause

REM exit


