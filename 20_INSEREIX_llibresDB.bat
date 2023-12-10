rem @ECHO OFF
for /F "usebackq tokens=1,2 delims==" %%i in (`wmic os get LocalDateTime /VALUE 2^>NUL`) do if '.%%i.'=='.LocalDateTime.' set ldt=%%j
SET ldt=%ldt:~0,4%_%ldt:~4,2%_%ldt:~6,2%-%ldt:~8,2%_%ldt:~10,2%_%ldt:~12,2%

mariadb --host=localhost --user=root --password=root --database=mysql --verbose < 20_INSEREIX_llibresDB.sql > log_20_INSEREIX_llibresDB_%ldt%.log

REM pause

REM exit

