set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local\Binaries\Win32\

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Binaries\Win32\DungeonDefenders.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Binaries\Win32\DunDefGame.exe" profile=any enable=yes >nul

"DungeonDefenders.exe"

exit