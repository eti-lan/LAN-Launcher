set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\BF4LAN" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\BF34Launcher.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\bf4.exe" profile=any enable=yes >nul
cls


@echo off 
:auswahl 
cls
echo. 
echo Battlefield 4
echo. 
echo   1. Start Battlelog (Default: http://bf4-battlelog/)
echo   2. Enter Battlelog IP-Address
echo   3. Exit 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto:start
if /i "%wahl%"=="2" goto:ip
if /i "%wahl%"=="3" goto:exit
echo Error! 
goto:auswahl  

:start
start "" "http://bf4-battlelog/"
exit


:ip
set /P IP=IP-Address (Exp.: 192.168.178.1):
start "" "http://%IP%/"
exit

:exit
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit