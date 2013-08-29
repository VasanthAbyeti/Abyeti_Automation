@echo off
rem rmdir c:\last_build
rem mkdir c:\ last_build
net use \\redhousefs-02\Development /delete
net use \\redhousefs-02\Development /user:wvargas idera*88
pushd \\redhousefs-02\Development\SQLdoctor\Builds\MainLine\Builds
FOR /F %%i IN ('dir /b /ad-h /od') DO (SET a=%%i)
echo Latest Directory: %a%
echo %a%>C:\product.build
xcopy /e /v /y %a% "c:\last_build"
cd /d "c:\last_build"
