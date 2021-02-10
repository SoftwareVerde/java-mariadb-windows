SET "JAVA_PID=%1"
SET "PID_FILE=%2"

:: Remove quotes from JAVA_PID
SET JAVA_PID=%JAVA_PID:"=%

echo "WATCHING %JAVA_PID%, KILLING %PID_FILE% UPON EXIT."

:checkParentProcess
:: Poll the PID every 5 seconds.
:: (Ping is more reliable and efficient than timeout.)
PING -n 5 127.0.0.1 >NUL

:: Clear the ERRORLEVEL variable.
CMD /C "EXIT /B 0"

:: Check if PID is active.
WMIC PROCESS WHERE "ProcessID = %JAVA_PID%" GET PROCESSID | FINDSTR -i %JAVA_PID%

IF "%ERRORLEVEL%"=="0" GOTO checkParentProcess

SET /P PID=<"%PID_FILE%"
TASKKILL /F /PID "%PID%"

EXIT
