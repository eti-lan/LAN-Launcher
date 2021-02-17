set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Binaries\Win32\UDK.exe" profile=any enable=yes >nul
cls

@echo off 
:auswahl 
cls
echo. 
echo Viscera Cleanup Detail LAN Server
echo. 
echo   1. Cadeceus     (90 min)
echo   2. Section 8    (45 Min)
echo   3. Exit 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto cadeceus
if /i "%wahl%"=="2" goto section8
if /i "%wahl%"=="3" goto end
echo Error! 
goto auswahl 


:cadeceus
cd local
"Binaries\Win32\UDK.exe" server VC_Caduceus?Game=VisceraGame.VCGame?lan?listen
goto end

:section8
cd local
"Binaries\Win32\UDK.exe" server VC_Section8?Game=VisceraGame.VCGame?lan?listen

cls
goto auswahl


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
