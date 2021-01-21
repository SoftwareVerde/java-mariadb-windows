SET "JAVA_PID=%1"
SET "PID_FILE=%2"

echo "WATCHING %JAVA_PID%, KILLING %PID_FILE% UPON EXIT."

:checkParentProcess
:: Poll the PID every 5 seconds.
:: (Ping is more reliable and efficient than timeout.)
PING -n 5 127.0.0.1 >NUL
:: Clear the ERRORLEVEL variable.
CMD /C "EXIT /B 0"
TASKLIST /NH /FI "pid eq %JAVA_PID%" 2>NUL | FIND /I /N "%JAVA_PID%">NUL
IF "%ERRORLEVEL%" == "0" GOTO checkParentProcess

SET /P PID=<"%PID_FILE%"
TASKKILL /F /PID "%PID%"

EXIT
