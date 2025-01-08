set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local/Binaries/Win64/Saves/settings

if %game_lang% == de (
	del /S language.txt
	@echo german> language.txt
)

if %game_lang% == en (
	del /S language.txt
	@echo english> language.txt	
)

if %game_lang% == fr (
	del /S language.txt
	@echo french> language.txt	
)

cd ../../

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Binaries\Win64\KFGame.exe" profile=any enable=yes >nul

"KFGame.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul
exit