setlocal EnableDelayedExpansion
cd /d "%~dp0"

echo off
cd local
netsh advfirewall firewall delete rule name="%game_id%" >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\CNC4SERVER.exe" profile=any enable=yes >nul

start "" CNC4SERVER.exe


:end
exit