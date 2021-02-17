@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
cls

@echo off 
cls
echo. 
echo Wolfenstein: Youngblood LAN Server

:server
cd server_rel
"python-3.7.4-embed-amd64\python.exe" server.py

:end
exit