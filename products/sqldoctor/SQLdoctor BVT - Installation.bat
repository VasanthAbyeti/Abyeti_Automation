@echo Installation
start /wait "TestExecute" "C:\Program Files (x86)\SmartBear\TestExecute 9\Bin\TestExecute.exe" ".\BVTSQLdoctor\BVTSQLdoctor.pjs" /r /p:BVTSQLdoctor /u:TC12624_Installation /rt:Installation /exit /SilentMode
call SaveResults.bat TC12624 TS882

