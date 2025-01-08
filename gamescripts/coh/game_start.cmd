set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"


if %game_lang% == de (
	echo [locale] > local\Locale.ini
	echo lang=German >> local\Locale.ini
)

if %game_lang% == en (
	echo [locale] > local\Locale.ini
	echo lang=English >> local\Locale.ini
)

if %game_lang% == fr (
	echo [locale] > local\Locale.ini
	echo lang=French >> local\Locale.ini
)

:auswahl
cls
echo. 
echo ----------------------------------
echo Company of Heroes - Tales of Valor
echo            LAN Edition
echo ----------------------------------
echo.
echo.
echo   1. Start
echo   2. Start Blitzkrieg-Mod
echo   3. Install more maps (for 2, 4 and 6 players)
echo   4. Show serials
echo   5. Exit
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto:start
if /i "%wahl%"=="2" goto:startbk
if /i "%wahl%"=="3" goto:maps
if /i "%wahl%"=="4" goto:serials
if /i "%wahl%"=="5" exit
echo Error! 
goto auswahl  


:start
cd "local"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%cd%\RelicCOH.exe" /t reg_sz /d "DISABLEDXMAXIMIZEDWINDOWEDMODE" /f
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\RelicCOH.exe" profile=any enable=yes >nul
"RelicCOH.exe"
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit

:startbk
cd "local"
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%cd%\RelicCOH.exe" /t reg_sz /d "DISABLEDXMAXIMIZEDWINDOWEDMODE" /f
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\RelicCOH.exe" profile=any enable=yes >nul
"RelicCOH.exe" -mod blitzkrieg
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit

:maps
set cohpath="%userprofile%\Documents\My Games\Company of Heroes\"
start /wait "LAN Launcher Update: %game_id%" "%programfiles%\eti\lan launcher\unrar.exe" x -o -y "%game_path%\coh_maps.eti" %cohpath%
goto auswahl

:serials
start local\Serials.txt
goto auswahl
