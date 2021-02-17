@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
cls

@echo off 
cls
echo. 
echo ET: Legacy Server

:server
"etlded.exe"

:end
exit