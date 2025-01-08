set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

start steam://

if %game_lang% == de (
	set lang=German
)

if %game_lang% == en (
	set lang=English
)

if %game_lang% == fr (
	set lang=French
)

cls

@echo off 
:auswahl 
cls
echo. 
echo Just Cause 3 (MP)
echo.
echo.
if %game_lang% == de (
echo [91mNote: Dieses Spiel benoetigt ein laufendes Steam um richtig zu funktionieren!
echo     Dein Steam wird jedoch in keiner Weise beeintraechtigt und du benoetigst das Spiel nicht in der Liste.  [0m
)
if %game_lang% == en (
echo [91mNote: This game requires a running Steam to work!
echo     However, your steam is not affected in any way and you do not need the game in the list.  [0m
)
if %game_lang% == fr (
echo [91mNote: Ce jeu necessite un Steam en cours dexecution pour fonctionner !
echo      Cependant, votre vapeur nest pas affectee et vous n avez pas besoin du jeu dans la liste. [0m
)

echo.
echo.
echo. 
pause
timeout 30
echo.

cd local
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\RVTLaunch_jc3mp.exe" profile=any enable=yes >nul
"RVTLaunch_jc3mp.exe"
timeout 30
pause


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
taskkill /f /im "Steam.exe"
exit