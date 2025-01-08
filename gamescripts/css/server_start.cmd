setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

cls

@echo off 
:auswahl 
cls
echo. 
echo Counter Strike: Source LAN Server
echo. 
echo   1. Start server 
echo   2. Edit Server.cfg
echo   3. Exit
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto css
if /i "%wahl%"=="2" goto cfg
if /i "%wahl%"=="3" goto end
echo Falsche Auswahl! 
goto auswahl 

:css
"srcds.exe" -console -game cstrike -insecure +maxplayers 64 -tickrate 66 +map de_dust2 +exec server.cfg
goto end

:cfg
notepad "cstrike\cfg\server.cfg"
cls
goto auswahl

:end
exit










