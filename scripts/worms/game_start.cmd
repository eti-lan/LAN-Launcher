set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\WormsWorldParty\SmartSteamLoader.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\WormsArmageddon\SmartSteamLoader.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\WormsReloaded\SmartSteamLoader.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\WormsRevolution\SmartSteamLoader.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\WormsXHD\SmartSteamLoader.exe" profile=any enable=yes >nul

cls

@echo off 
:auswahl 
cls
echo. 
echo Worms MEGA-Pack
echo. 
echo   1. Worms World Party Remastered
echo   2. Worms Armageddon
echo   3. Worms Reloaded
echo   4. Worms Revolution
echo   5. Worms Ultimate Mayhem(3D)
echo   6. Beenden 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto:Party
if /i "%wahl%"=="2" goto:Armageddon
if /i "%wahl%"=="3" goto:Reloaded
if /i "%wahl%"=="4" goto:Revolution
if /i "%wahl%"=="5" goto:Mayhem
if /i "%wahl%"=="6" goto:exit
echo Falsche Auswahl! 
goto:auswahl 

:Party
cd local
cd WormsWorldParty
"SmartSteamLoader.exe"
goto:exit 

:Armageddon 
cd local
cd WormsArmageddon
"SmartSteamLoader.exe"
goto:exit 

:Reloaded
cd local
cd WormsReloaded
"SmartSteamLoader.exe"
goto:exit

:Revolution
cd local
cd WormsRevolution
"SmartSteamLoader.exe"
goto:exit

:Mayhem
cd local
cd WormsXHD
"SmartSteamLoader.exe"
goto:exit


:exit
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
