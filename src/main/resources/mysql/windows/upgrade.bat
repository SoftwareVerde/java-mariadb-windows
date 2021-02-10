SET "SCRIPT_DIR=%~dp0"
SET "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
SET "PORT=%1"

CD "%SCRIPT_DIR%"

@ECHO OFF
SET "PASSWORD=%2"

ECHO CMD /C ""%SCRIPT_DIR%\base\bin\mysql_upgrade.exe" -h 127.0.0.1 -P "%PORT%" -u root -p"
CMD /C ""%SCRIPT_DIR%\base\bin\mysql_upgrade.exe" -h 127.0.0.1 -P "%PORT%" -u root -p%PASSWORD%"

