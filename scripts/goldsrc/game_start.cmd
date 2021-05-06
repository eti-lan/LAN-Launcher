@echo off

@echo off

for /f "delims=" %%# in  ('"wmic path Win32_VideoController  get CurrentHorizontalResolution,CurrentVerticalResolution /format:value"') do (
  set "%%#">nul
)

set w=%CurrentHorizontalResolution%
set h=%CurrentVerticalResolution%

cls

set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
copy /y "SmartSteamEmu.ini" "hl-cs16\SmartSteamEmu.ini"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\hl-cs16\SmartSteamLoader.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\hl-cs16\hl.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\hl-cs15\hl.exe" profile=any enable=yes >nul

:auswahl 
cls
echo. 
echo Valve Goldsource Classics
echo. 
echo   1. Counter-Strike 1.6
echo   2. Counter-Strike 1.5 (pre-Steam)
echo   3. Half-Life
echo   4. Half-Life (pre-Steam)
echo   5. Beenden 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto CS16
if /i "%wahl%"=="2" goto CS15
if /i "%wahl%"=="3" goto HL
if /i "%wahl%"=="4" goto HLPS
if /i "%wahl%"=="5" goto exit
echo Falsche Auswahl! 
goto auswahl 

:CS16
cd "hl-cs16"
"SmartSteamLoader.exe" -game cstrike
goto exit 

:CS15
cd "hl-cs15"
"hl.exe" -dev -console -novideo -nojoy -noipx -game cstrike 
goto exit 

:HL
cd "hl-cs16"
"SmartSteamLoader.exe"
goto exit

:HLPS
cd "hl-cs15"
"hl.exe" -dev -console -novideo -nojoy -noipx
goto exit


:exit 
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
