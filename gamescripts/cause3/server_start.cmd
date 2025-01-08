@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls

@echo off 
:mainmenu 
cls
echo. 
echo Just Cause 3  MP Server
echo. 
echo   1. Start 
echo   2. Exit
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto:server
if /i "%wahl%"=="2" exit
goto:mainmenu  

:server
cd local
cd server
"Server.exe"
exit
