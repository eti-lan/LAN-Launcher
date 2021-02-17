set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\EE3.exe" profile=any enable=yes >nul

"EE3.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit