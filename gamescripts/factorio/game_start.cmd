set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\bin\x64\factorio.exe" profile=any enable=yes >nul

cls

:Stable
cd "local\bin\x64"
"factorio.exe"
goto:exit 


:exit 
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit