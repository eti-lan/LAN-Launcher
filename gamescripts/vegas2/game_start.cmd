set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"


if %game_lang% == de (
	set lang=German
)

if %game_lang% == en (
	set lang=English
)

if %game_lang% == fr (
	set lang=French
)

reg.exe add "HKLM\SOFTWARE\Ubisoft\Tom Clancy's Rainbow Six Vegas 2" /v "Language" /t REG_SZ /d "%lang%" /f
reg.exe add "HKLM\SOFTWARE\Ubisoft\Tom Clancy's Rainbow Six Vegas 2\1.00" /f
reg.exe add "HKLM\SOFTWARE\Ubisoft\Tom Clancy's Rainbow Six Vegas 2\GameUpdate" /v "language" /t REG_SZ /d "%game_lang%" /f

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\binaries\TeknoR6Vegas2.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\binaries\R6Vegas2_Game.exe" profile=any enable=yes >nul

set widescreen=0
cls

@echo off 
:auswahl 
cls
echo. 
echo Tom Clancys Rainbox Six Vegas 2 (1.03)
echo.
echo.
echo [91mNote: Disable voice recognition in settings to prevent gun sound bug.
echo       Press ESC after game to close window.                          [0m
echo.
echo.
echo   1. Standard
echo   2. Standard + 99 Terrorists
echo   3. No player limit
echo   4. No player limit + 99 Terrorists
echo.
if %widescreen% == 1 (echo   5. Multi-Monitor Widescreen Patch [41m ON [0m ) else (echo   5. Multi-Monitor Widescreen Patch [42m OFF [0m)
echo   6. Exit
echo. 
echo.
set /P wahl=Choose:  

if /i "%wahl%"=="1" goto:1
if /i "%wahl%"=="2" goto:2
if /i "%wahl%"=="3" goto:3
if /i "%wahl%"=="4" goto:4
if /i "%wahl%"=="5" goto:5
if /i "%wahl%"=="6" goto:exit
echo Error! 
goto:auswahl 

:1
cd local
cd binaries
"TeknoR6Vegas2.exe" 0 0 %widescreen%
goto end

:2
cd local
cd binaries
"TeknoR6Vegas2.exe" 0 1 %widescreen%
goto end

:3
cd local
cd binaries
"TeknoR6Vegas2.exe" 1 0 %widescreen%
goto end

:4
cd local
cd binaries
"TeknoR6Vegas2.exe" 1 1 %widescreen%
goto end

:5
if %widescreen% == 1 (set widescreen=0) else (set widescreen=1)
goto auswahl


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
