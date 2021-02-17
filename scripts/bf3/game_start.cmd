set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\bf3-fox\FirefoxPortable.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Redirector.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\LanBf3.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\bf3.exe" profile=any enable=yes >nul
cls


@echo off 
:auswahl 
cls
echo. 
echo Battlefield 3
echo. 
echo   1. Start Battlelog (Default: http://bf3-battlelog/)
echo   2. Enter Battlelog IP-Address
echo   3. Redirector Setup
echo   4. Exit 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto:start
if /i "%wahl%"=="2" goto:ip
if /i "%wahl%"=="3" goto:redirector
if /i "%wahl%"=="4" goto:exit
echo Error! 
goto:auswahl  

:start
cd "local\BF3-Fox"
"FirefoxPortable.exe" http://bf3-battlelog/
exit


:ip
set /P IP=IP-Adresse (Bsp.: 192.168.178.1):
cd "local\BF3-Fox"
"FirefoxPortable.exe" http://%IP%/
exit

:redirector
cls
echo. 
echo Battlefield 3 - Redirector Setup
echo. 
echo   1. Windows 10
echo   2. Windows 7/8
echo   3. Menu
echo. 

set /P wahl=Auswahl: 

if /i "%wahl%"=="1" goto:win10
if /i "%wahl%"=="2" goto:win78
if /i "%wahl%"=="3" goto:auswahl


:win10
start redirector-win-10.exe
goto:auswahl

:win78
start redirector-win-7-8.exe
goto:auswahl


:exit
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit