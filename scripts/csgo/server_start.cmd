setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls

@echo off 
:auswahl 
cls
echo. 
echo Counter Strike: Global Offensive Server
echo. 
echo   1. Counter Strike: Global Offensive Server starten
echo   2. Server.cfg bearbeiten
echo   3. Beenden 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto csgo
if /i "%wahl%"=="2" goto cfg
if /i "%wahl%"=="3" goto end
echo Falsche Auswahl! 
goto auswahl 

:csgo
cd local
"srcds.exe" -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_active +map de_mirage +sv_pure 0 +sv_lan 1 -threads 2 -tickrate 128 +exec server.cfg
goto end

:cfg
cd local
notepad "dedicated.cfg"
copy /y "dedicated.cfg" "csgo\cfg\server.cfg"
rem copy /y "dedicated_armsrace.cfg" "csgo\cfg\gamemode_armsrace_server.cfg"
rem copy /y "dedicated_casual.cfg" "csgo\cfg\gamemode_casual_server.cfg"
rem copy /y "dedicated_competitive.cfg" "csgo\cfg\gamemode_competitive_server.cfg"
rem copy /y "dedicated_demolition.cfg" "csgo\cfg\gamemode_demolition_server.cfg"
cls
goto auswahl

:end
exit
