set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\FactoryGame\Binaries\Win64\FactoryGame-Win64-Shipping.exe" profile=any enable=yes >nul

echo {> "NemirtingasEpicEmu.json"
echo   "disable_online_networking": true,>> "NemirtingasEpicEmu.json"
echo   "username": "%player%">> "NemirtingasEpicEmu.json"
echo }>> "NemirtingasEpicEmu.json"


cd "FactoryGame\Binaries\Win64"

"FactoryGame-Win64-Shipping.exe" -AUTH_LOGIN=unused -AUTH_PASSWORD=901dbe79901dbe79901dbe79901dbe79 -AUTH_TYPE=exchangecode -epicapp=app_name -epicenv=Prod -EpicPortal -epiclocale=en-US


netsh advfirewall firewall delete rule name="%game_id%" >nul
exit