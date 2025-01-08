set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Youngblood_x64vk_serveremu.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Youngblood_x64.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\server_rel\python-3.7.4-embed-amd64\python.exe" profile=any enable=yes >nul

"serveremu_patcher.exe"
"Youngblood_x64vk_serveremu.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul

:end 
exit
