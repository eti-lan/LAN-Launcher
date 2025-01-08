set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\SPEED2.EXE" profile=any enable=yes >nul


if %game_lang% == de (
	copy /y "languages\source\german.bin" "languages\english.bin"
)

if %game_lang% == en (
	copy /y "languages\source\english.bin" "languages\english.bin"
)

if %game_lang% == fr (
	copy /y "languages\source\french.bin" "languages\english.bin"
)

"SPEED2.EXE"

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit