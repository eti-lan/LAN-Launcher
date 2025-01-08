set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\gamedata\BattlefrontII.exe" profile=any enable=yes >nul


if %game_lang% == de (
cd GameData
BattlefrontII.exe /lang 4
)

if %game_lang% == en (
cd GameData
BattlefrontII.exe /lang 6
)

if %game_lang% == fr (
cd GameData
BattlefrontII.exe /lang 3
)


netsh advfirewall firewall delete rule name="%game_id%" >nul

exit