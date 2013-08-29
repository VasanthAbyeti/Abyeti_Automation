::-------------------------------------------- SaveResults.bat --------------------------------------
@echo off
set X=
for /f "skip=1 delims=" %%x in ('wmic os get localdatetime') do if not defined X set X=%%x
set DATE.YEAR=%X:~0,4%
set DATE.MONTH=%X:~4,2%
set DATE.DAY=%X:~6,2%
set DATE.HOUR=%X:~8,2%
set DATE.MINUTE=%X:~10,2%
set DATE.SECOND=%X:~12,2%
set current_date=%DATE.YEAR%-%DATE.MONTH%-%DATE.DAY%T%DATE.HOUR%:%DATE.MINUTE%:%DATE.SECOND%
set /p product_build=<"C:\product.build"


ECHO Test Case: %1
ECHO Test Set: %2
ECHO Build: %product_build% 

::TestComplete status
IF ERRORLEVEL 4 GOTO Unknown
IF ERRORLEVEL 3 GOTO CannotRun
IF ERRORLEVEL 2 GOTO Errors
IF ERRORLEVEL 1 GOTO Warnings
IF ERRORLEVEL 0 GOTO Success

:Unknown 
ECHO Status: Error
ECHO Return Code: Unknown return code
@echo off
"c:\Program Files (x86)\GnuWin32\bin\wget.exe" "http://10.220.202.60/framework/RallyAPI/TestCaseResult_update.php?c=%1&s=%2&v=Error&b=%product_build%&d=%current_date%" -q 1> NUL 2> wgeterr.log
GOTO Return

:CannotRun 
ECHO Status: Error
ECHO Return Code: The test cannot be run
@echo off
"c:\Program Files (x86)\GnuWin32\bin\wget.exe" "http://10.220.202.60/framework/RallyAPI/TestCaseResult_update.php?c=%1&s=%2&v=Error&b=%product_build%&d=%current_date%" -q 1> NUL 2> wgeterr.log
GOTO Return

:Errors 
ECHO Status: Failed
ECHO Return Code: There are errors
@echo off
"c:\Program Files (x86)\GnuWin32\bin\wget.exe" "http://10.220.202.60/framework/RallyAPI/TestCaseResult_update.php?c=%1&s=%2&v=Fail&b=%product_build%&d=%current_date%" -q 1> NUL 2> wgeterr.log
GOTO Return

:Warnings 
ECHO Status: Passed
ECHO Return Code: There are warnings
@echo off
"c:\Program Files (x86)\GnuWin32\bin\wget.exe" "http://10.220.202.60/framework/RallyAPI/TestCaseResult_update.php?c=%1&s=%2&v=Pass&b=%product_build%&d=%current_date%" -q 1> NUL 2> wgeterr.log
GOTO Return

:Success 
ECHO Status: Passed
ECHO Return Code: No errors
@echo off
"c:\Program Files (x86)\GnuWin32\bin\wget.exe" "http://10.220.202.60/framework/RallyAPI/TestCaseResult_update.php?c=%1&s=%2&v=Pass&b=%product_build%&d=%current_date%" -q 1> NUL 2> wgeterr.log

:Return
::-------------------------------------------- SaveResults.bat --------------------------------------