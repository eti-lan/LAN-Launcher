set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

echo %player% > "account_name.txt"
echo %player% > "settings\account_name.txt"

if %game_lang% == de (
echo german > "settings\language.txt"
)

if %game_lang% == en (
echo english > "settings\language.txt"
)

if %game_lang% == fr (
echo french > "settings\language.txt"
)


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\PlagueIncEvolved.exe" profile=any enable=yes >nul

"PlagueIncEvolved.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit