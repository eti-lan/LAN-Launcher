set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"


@echo off 
:auswahl 
cls
echo. 
echo Gang Beasts Dedicated LAN Server
echo. 
echo   1. Gang Beasts Server starten
echo   2. Config bearbeiten
echo   3. Beenden 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto server
if /i "%wahl%"=="2" goto cfg
if /i "%wahl%"=="3" goto end
echo Falsche Auswahl! 
goto auswahl 

:server
cd local
cd Gang Beasts Server
"Wrapper.exe"
goto end

:cfg
cd local
notepad "Gang Beasts Server\game\GangBeasts_Data\Config\Server\config.json"

cls
goto auswahl

:end
exit
