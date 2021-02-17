set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\aoe2-hd\SmartSteamLoader.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\aoe2-hd\AoK HD.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\aoe2-classic\age2_x1\age2_x1.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\aoe2-classic\age2_x1\age2_x2.exe" profile=any enable=yes >nul

cls

@echo off 
:auswahl 
cls
echo. 
echo Age of Empires II
echo. 
echo   1. HD Edition
echo   2. Classic
echo   3. Classic - The Conquerors Expansion
echo   4. Classic - Forgotten Empires
echo   5. Exit
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto:HD
if /i "%wahl%"=="2" goto:Classic
if /i "%wahl%"=="3" goto:Conquerors
if /i "%wahl%"=="4" goto:Forgotten
if /i "%wahl%"=="5" goto:exit
echo Error! 
goto:auswahl 

:HD
cd local
cd aoe2-hd
"SmartSteamLoader.exe"
goto:exit 

:Classic 
cd local
cd aoe2-classic
"empires2.exe"
goto:exit 

:Conquerors
cd local
cd aoe2-classic
cd age2_x1
"age2_x1.exe"
goto:exit

:Forgotten
cd local
cd aoe2-classic
cd age2_x1
"age2_x2.exe"
goto:exit

:exit 
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit