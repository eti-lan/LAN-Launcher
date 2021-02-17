set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\s2_mp64_ship.exe" profile=any enable=yes >nul
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"


@echo off
:auswahl
cls
echo.
echo Call of Duty: WWII
echo.
echo	1. Multiplayer
echo	2. Multiplayer + NAZI Zombies
echo	3. Exit
echo.
set /P wahl=Auswahl:

if /i "%wahl%"=="1" goto:start
if /i "%wahl%"=="2" goto:startzombies
if /i "%wahl%"=="3" goto:exit
echo Error!
goto:auswahl

:start
cd local
"s2_mp64_ship.exe"
exit

:startzombies
cd local
"s2_mp64_ship.exe" +zombiesMode 1 
exit


:exit
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit