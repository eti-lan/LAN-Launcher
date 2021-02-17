set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local


if %game_lang% == de (
	set lang=german
)

if %game_lang% == en (
	set lang=english
)

if %game_lang% == fr (
	set lang=french
)


reg.exe add "HKLM\SOFTWARE\WOW6432Node\EA GAMES\Battlefield 1942" /v "Language" /t REG_SZ /d "%lang%" /f
reg.exe add "HKLM\SOFTWARE\EA GAMES\Battlefield 1942" /v "Language" /t REG_SZ /d "%lang%" /f

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Launcher.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\bf1942.exe" profile=any enable=yes >nul

"Launcher.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit