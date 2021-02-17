set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4
set "masterserver=cossacks3.servers.lan"

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

:check_masterserver
ping %masterserver% -n 1 -4 | find /i "TTL=" >nul
if errorlevel 1 goto changeIP
if errorlevel 0 goto start

:changeIP
set /P masterserver=Enter Cossacks 3 LAN-Server IP-Address (Example.: 192.168.178.1):
echo section.begin 					> data\resources\servers.dat 
echo    * = %masterserver%:31523	>> data\resources\servers.dat
echo section.end					>> data\resources\servers.dat
goto check_masterserver

:start
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\cossacks.exe" profile=any enable=yes >nul
echo Starting Cossacks 3 ....
"cossacks.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul
goto end

:end
echo section.begin 						> data\resources\servers.dat 
echo    * = cossacks3.servers.lan:31523	>> data\resources\servers.dat
echo section.end						>> data\resources\servers.dat
exit

