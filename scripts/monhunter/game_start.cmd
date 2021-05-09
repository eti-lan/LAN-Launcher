set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Monster Hunter World.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\MonsterHunterWorld.exe" profile=any enable=yes >nul

"Monster Hunter World.exe"


:end 
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit

