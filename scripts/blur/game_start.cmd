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
        del /f /q *.txt
	echo 1 > german.txt
)

if %game_lang% == en (
        del /f /q *.txt
	echo 1 > english.txt
)

if %game_lang% == fr (
        del /f /q *.txt
	echo 1 > french.txt
)


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Blur.exe" profile=any enable=yes >nul

"blur.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit