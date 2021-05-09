set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Civilization4.exe" profile=any enable=yes >nul

"Civilization4.exe"


:end 
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit

