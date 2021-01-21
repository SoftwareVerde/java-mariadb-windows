SET "SCRIPT_DIR=%~dp0"
SET "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
SET /P DATA_DIR=<"%SCRIPT_DIR%\.datadir"
SET "JAVA_PID=%1"

CD "%SCRIPT_DIR%"

PUSHD "%DATA_DIR%"
SET "DATA_DIR=%CD%"
POPD

SET "DEFAULTS_FILE=%DATA_DIR%\my.ini"
SET "BASE_DIR=%SCRIPT_DIR%\base"
SET "TMP_DIR=%DATA_DIR%\tmp"
SET "PID_FILE=%DATA_DIR%\mysql.pid"

IF NOT EXIST "%TMP_DIR%" MKDIR "%TMP_DIR%"

START "" /B "%SCRIPT_DIR%\base\bin\mysqld.exe" --defaults-file="%DEFAULTS_FILE%" --basedir="%BASE_DIR%" --datadir="%DATA_DIR%" --tmpdir="%TMP_DIR%" --pid-file="%PID_FILE%" --console

START "" /B "%SCRIPT_DIR%\startservice.vbs" "%SCRIPT_DIR%\watchpid.bat" "%JAVA_PID%" "%PID_FILE%" ""

SET /P TMP=

SET /P PID=<"%PID_FILE%"
TASKKILL /F /PID "%PID%"

