@echo on

FOR /F "skip=1 tokens=1-6" %%A IN ('WMIC Path Win32_LocalTime Get Day^,Hour^,Minute^,Second /Format:table ^| findstr /r "."') DO (
 set Day=%%A
 set Hour=%%B
 set Minute=%%C
 set Second=%%D
)

set WORKSPACE=c:\repository\Automation
if "%BUILD_ID%"=="" set BUILD_ID=%Day%-%Hour%-%Minute%-%Second%

set LOGFOLDER=%WORKSPACE%\products\sqldoctor\logs\%BUILD_ID%
mkdir %LOGFOLDER%

echo | set /p=%WORKSPACE%
>c:\SQLDoctorPath.txt echo %WORKSPACE%

Set ts=TS924


REM Register

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:SQLDoctorRegister /rt:Test1 /exit /Silentmode /exportlog:%LOGFOLDER%\Registration.mht


REM Clean up

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:CleanUp /rt:Test1 /exit /Silentmode /exportlog:%LOGFOLDER%\CleaningUp.mht






REM run the TC12618_BVTSessionsView Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC12618_BVTSessionsView /rt:TC12618 /exit /Silentmode /exportlog:%LOGFOLDER%\TC12618_BVTSessionsView.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC12618 TS924


REM run the TC19307_AddServerWindowsAuthentication Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19307_AddServerWindowsAuthentication /rt:TC19307 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19307_AddServerWindowsAuthentication.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19307 TS924



REM run the TC19308_AddServerSQLAuthentication Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19308_AddServerSQLAuthentication /rt:TC19308 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19308_AddServerSQLAuthentication.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19308 TS924



REM run the TC19309_AddServerServerOptionsProductionServer Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19309_AddServerServerOptionsProductionServer /rt:TC19309 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19309_AddServerServerOptionsProductionServer.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19309 TS924


REM run the TC19310_AddServerAdvancedConnectionSettingsOLE Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19310_AddServerAdvancedConnectionSettingsOLE /rt:TC19310 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19310_AddServerAdvancedConnectionSettingsOLE.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19310 TS924




REM run the TC19311_AddServerAdvancedConnectionSettingsWMIOptions Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19311_AddServerAdvancedConnectionSettingsWMIOptions /rt:TC19311 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19311_AddServerAdvancedConnectionSettingsWMIOptions.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19311 TS924



REM run the TC19316_BVTRemoveServerNetworkInstance Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19316_BVTRemoveServerNetworkInstance /rt:TC19316 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19316_BVTRemoveServerNetworkInstance.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19316 TS924




REM run the TC19440_ManualAnalysisCancel Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19440_ManualAnalysisCancel /rt:TC19440 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19440_ManualAnalysisCancel.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19440 TS924




REM run the TC19458_AddServerServerOptionsOnlineTransactionProcessing Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19458_AddServerServerOptionsOnlineTransactionProcessing /rt:TC19458 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19458_AddServerServerOptionsOnlineTransactionProcessing.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19458 TS924



REM run the TC19929_GeneralSettings_AnalysisResultsLocation Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19929_GeneralSettings_AnalysisResultsLocation /rt:TC19929 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19929_GeneralSettings_AnalysisResultsLocation.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19929 TS924


REM run the TC19930_GeneralSettingsCredentialsforindividualserver Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19930_GeneralSettingsCredentialsforindividualserver /rt:TC19930 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19930_GeneralSettingsCredentialsforindividualserver.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19930 TS924


REM run the TC19931_GeneralSettingsProductionServer Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19931_GeneralSettingsProductionServer /rt:TC19931 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19931_GeneralSettingsProductionServer.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19931 TS924


REM run the TC19932_GeneralSettingsOnlineTransactionProcessing Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19932_GeneralSettingsOnlineTransactionProcessing /rt:TC19932 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19932_GeneralSettingsOnlineTransactionProcessing.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19932 TS924


REM run the TC19933_GeneralSettingsAdvancedConnectionSettingsOLE Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19933_GeneralSettingsAdvancedConnectionSettingsOLE /rt:TC19933 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19933_GeneralSettingsAdvancedConnectionSettingsOLE.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19933 TS924


REM run the TC19967_DashboardViewAllServersLinks Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19967_DashboardViewAllServersLinks /rt:TC19967 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19967_DashboardViewAllServersLinks.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19967 TS924


REM run the TC20007_DashboardViewAllServersAnalysisIinformation Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC20007_DashboardViewAllServersAnalysisIinformation /rt:TC20007 /exit /Silentmode /exportlog:%LOGFOLDER%\TC20007_DashboardViewAllServersAnalysisIinformation.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC20007 TS924

REM run the TC19306_BVTAddServerWithAnalysisNetworkInstance Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19306_BVTAddServerWithAnalysisNetworkInstance /rt:TC19306 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19306_BVTAddServerWithAnalysisNetworkInstance.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19306 TS924

REM run the TC19319_RemoveServerMultipleInstances Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19319_RemoveServerMultipleInstances /rt:TC19319 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19319_RemoveServerMultipleInstances.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19319 TS924


REM run the TC19491_RemoveServerAllInstances Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19491_RemoveServerAllInstances /rt:TC19491 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19491_RemoveServerAllInstances.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19491 TS924



REM run the TC19492_RemoveServerUnavailableServer Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19492_RemoveServerUnavailableServer /rt:TC19492 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19492_RemoveServerUnavailableServer.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19492 TS924


REM run the TC19934_GeneralSettingsAdvancedConnectionSettingsWMIConnectionOptions Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19934_GeneralSettingsAdvancedConnectionSettingsWMIConnectionOptions /rt:TC19934 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19934_GeneralSettingsAdvancedConnectionSettingsWMIConnectionOptions.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19934 TS924


REM run the TC20041_DashboardViewAnalysisHistory Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC20041_DashboardViewAnalysisHistory /rt:TC20041 /exit /Silentmode /exportlog:%LOGFOLDER%\TC20041_DashboardViewAnalysisHistory.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC20041 TS924


REM run the TC20042_DashboardViewAnalysisHistoryChangelocation Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC20042_DashboardViewAnalysisHistoryChangelocation /rt:TC20042 /exit /Silentmode /exportlog:%LOGFOLDER%\TC20042_DashboardViewAnalysisHistoryChangelocation.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC20042 TS924


REM run the TC20090_DashboardViewAnalysisHistoryManuallyGroomResults Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC20090_DashboardViewAnalysisHistoryManuallyGroomResults /rt:TC20090 /exit /Silentmode /exportlog:%LOGFOLDER%\TC20090_DashboardViewAnalysisHistoryManuallyGroomResults.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC20090 TS924


REM run the TC19343_ManualAnalysisCategories Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19343_ManualAnalysisCategories /rt:TC19343 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19343_ManualAnalysisCategories.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19343 TS924


REM run the TC19351_ManualAnalysisApplicationsSingleApplication Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19351_ManualAnalysisApplicationsSingleApplication /rt:TC19351 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19351_ManualAnalysisApplicationsSingleApplication.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19351 TS924


REM run the TC19352_ManualAnalysisDuration Test

REM "c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19352_ManualAnalysisDuration /rt:TC19352 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19352_ManualAnalysisDuration.mht

REM set err=Fail
REM IF %ERRORLEVEL% EQU 0 set err=Pass
REM IF %ERRORLEVEL% EQU 1 set err=Pass
REM echo %err%

REm call SaveResults.bat TC19352 TS924


REM run the TC19356_ScheduledAnalysisWeeklyScheduledTask Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19356_ScheduledAnalysisWeeklyScheduledTask /rt:TC19356 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19356_ScheduledAnalysisWeeklyScheduledTask.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19356 TS924


REM run the TC19439_AddServerNoAnalysisLocalInstance Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19439_AddServerNoAnalysisLocalInstance /rt:TC19439 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19439_AddServerNoAnalysisLocalInstance.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19439 TS924


REM run the TC19442_AddServeNoAnalysisNetworkInstance Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19442_AddServeNoAnalysisNetworkInstance /rt:TC19442 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19442_AddServeNoAnalysisNetworkInstance.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19442 TS924


REM run the TC19525_ManualAnalysisApplicationsMultipleApplications Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19525_ManualAnalysisApplicationsMultipleApplications /rt:TC19525 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19525_ManualAnalysisApplicationsMultipleApplications.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19525 TS924


REM run the TC19657_ScheduledAnalysisCancel Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19657_ScheduledAnalysisCancel /rt:TC19657 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19657_ScheduledAnalysisCancel.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19657 TS924


REM run the TC19703_BlockedRecommendationsSetForIndividualServer Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19703_BlockedRecommendationsSetForIndividualServer /rt:TC19703 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19703_BlockedRecommendationsSetForIndividualServer.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19703 TS924


REM run the TC19707_BlockedRecommendationsNotInAnalysisResults Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19707_BlockedRecommendationsNotInAnalysisResults /rt:TC19707 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19707_BlockedRecommendationsNotInAnalysisResults.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19707 TS924




REM run the TC19350_ManualAnalysisDatabases Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19350_ManualAnalysisDatabases /rt:TC19350 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19350_ManualAnalysisDatabases.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19350 TS924



REM run the TC19714_BlockedDatabasesNotInAnalysisResults Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19714_BlockedDatabasesNotInAnalysisResults /rt:TC19714 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19714_BlockedDatabasesNotInAnalysisResults.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19714 TS924



REM run the TC19910_BlockedDatabasesAlldatabaseslisted Test

"c:\Program Files (x86)\SmartBear\TestExecute 9\bin\TestExecute.exe" "%WORKSPACE%\products\sqldoctor\SQLDoctor\SQLDoctor.pjs" /run /project:SQLDoctor_TestCases /u:TC19910_BlockedDatabasesAlldatabaseslisted /rt:TC19910 /exit /Silentmode /exportlog:%LOGFOLDER%\TC19910_BlockedDatabasesAlldatabaseslisted.mht

set err=Fail
IF %ERRORLEVEL% EQU 0 set err=Pass
IF %ERRORLEVEL% EQU 1 set err=Pass
echo %err%

call SaveResults.bat TC19910 TS924

