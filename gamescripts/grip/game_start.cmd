set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Grip\Binaries\Win64\Grip-Win64-Shipping.exe" profile=any enable=yes >nul

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Grip\Binaries\Win64\LAN\bin_Win64\PhotonSocketServer.exe" profile=any enable=yes >nul


"Grip\Binaries\Win64\Grip-Win64-Shipping.exe"


netsh advfirewall firewall delete rule name="%game_id%" >nul

exit