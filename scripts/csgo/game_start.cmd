set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

copy /y "..\eti_launcher\bin\avatar-1.png" "local\platform\avatar.dat"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Loader.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\csgo.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\srcds.exe" profile=any enable=yes >nul
cls

@echo off 
:auswahl 
cls
echo. 
echo Counter Strike: Global Offensive
echo. 
echo   1. Start Counter Strike: Global Offensive
echo   2. Edit Client.cfg
echo   3. Exit
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto csgo
if /i "%wahl%"=="2" goto cfg
if /i "%wahl%"=="3" goto end
echo Error! 
goto:auswahl 

:csgo
cd local >nul
copy /y "client.cfg" "csgo\cfg\config.cfg" >nul
"Loader.exe"
goto end

:cfg
cd local >nul
notepad "client.cfg"
cls
goto auswahl


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
