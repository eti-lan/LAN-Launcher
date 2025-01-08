set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

chcp 65001
echo %player% > "profiles\profile1\name.dat"
copy /y "lang\%game_lang%.ini" "regions.ini"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\soulstorm.exe" profile=any enable=yes >nul

"soulstorm.exe"
exit