set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

if exist "server" (
    goto start
) else (
    goto server_setup
)

:server_setup
"cossacks_server.exe"
timeout 5
goto start
exit

:start
cls
cd server

netsh advfirewall firewall add rule name="Cossacks3LanServer" dir=in action=allow program="%game_path%\server\Cossacks3LanServer.exe" profile=any enable=yes >nul

echo Starting Cossacks 3 LAN Server....
"Cossacks3LanServer.exe"

netsh advfirewall firewall delete rule name="Cossacks3LanServer" >nul
goto end

:end
exit

