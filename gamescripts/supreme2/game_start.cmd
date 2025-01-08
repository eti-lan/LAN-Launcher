set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
cd bin

taskkill /f /im "Steam.exe"
cls

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Supreme Commander 2.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\SupremeCommander2.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\bin\supremecommander2.exe" profile=any enable=yes >nul

start /wait "" "Supreme Commander 2.exe"

:end
taskkill /f /im "Supreme Commander 2.exe"
taskkill /f /im "SupremeCommander2.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul
exit