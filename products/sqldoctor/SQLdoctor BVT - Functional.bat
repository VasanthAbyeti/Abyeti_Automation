@echo AddNewServer
start /wait "TestExecute" "C:\Program Files (x86)\SmartBear\TestExecute 9\Bin\TestExecute.exe" ".\BVTSQLdoctor\BVTSQLdoctor.pjs" /r /p:BVTSQLdoctor /u:TC12625_AddNewServer /rt:AddNewServer /exit /SilentMode
call SaveResults.bat TC12625 TS882
@echo PerformFullAnalysis
start /wait "TestExecute" "C:\Program Files (x86)\SmartBear\TestExecute 9\Bin\TestExecute.exe" ".\BVTSQLdoctor\BVTSQLdoctor.pjs" /r /p:BVTSQLdoctor /u:TC12614_PerformFullAnalysis /rt:PerformFullAnalysis /exit /SilentMode
call SaveResults.bat TC12614 TS882
@echo DocumentationAndHelp
start /wait "TestExecute" "C:\Program Files (x86)\SmartBear\TestExecute 9\Bin\TestExecute.exe" ".\BVTSQLdoctor\BVTSQLdoctor.pjs" /r /p:BVTSQLdoctor /u:TC12623_DocumentationAndHelp /rt:DocumentationAndHelp /exit /SilentMode
call SaveResults.bat TC12623 TS882
@echo ScheduledAnalysis
start /wait "TestExecute" "C:\Program Files (x86)\SmartBear\TestExecute 9\Bin\TestExecute.exe" ".\BVTSQLdoctor\BVTSQLdoctor.pjs" /r /p:BVTSQLdoctor /u:TC12627_ScheduledAnalysis /rt:ScheduledAnalysis /exit /SilentMode
call SaveResults.bat TC12627 TS882
@echo RemoveServer Local Instance
start /wait "TestExecute" "C:\Program Files (x86)\SmartBear\TestExecute 9\Bin\TestExecute.exe" ".\BVTSQLdoctor\BVTSQLdoctor.pjs" /r /p:BVTSQLdoctor /u:TC19315_RemoveServer_LocalInstance /rt:RemoveServer_LocalInstance /exit /SilentMode
call SaveResults.bat TC19315 TS882
