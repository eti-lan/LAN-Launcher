set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Stronghold Crusader.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Stronghold_Crusader_Extreme.exe" profile=any enable=yes >nul
cls

@echo off 
:auswahl 
cls
echo. 
echo Stronghold Crusader HD
echo. 
echo   1. Stronghold Crusader HD 
echo   2. Stronghold Crusader HD Extreme
echo   3. Beenden 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto:stronghold
if /i "%wahl%"=="2" goto:strongholdextreme
if /i "%wahl%"=="3" goto:exit
echo Falsche Auswahl! 
goto:auswahl 

:stronghold
cd local
"Stronghold Crusader.exe"
goto:exit 

:strongholdextreme 
cd local
"Stronghold_Crusader_Extreme.exe"
goto:exit 


:exit 
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit