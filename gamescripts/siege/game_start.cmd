set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\RainbowSix.exe" profile=any enable=yes >nul


if exist "local\videos\xstartup" (
    move "local\videos\xstartup" "local\videos\startup"
	cd local
	"RainbowSix.exe"
) else (
    cd local
	"RainbowSix.exe"
)

ping 127.0.0.1 -n 10 > nul


pause

:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
