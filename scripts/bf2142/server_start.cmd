rem BF2142 - Server 
@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls

if exist "server" (
    goto server_init
) else (
    goto server_setup
)

exit

:server_setup
"bf2142_server.exe"
timeout 5
goto mainmenu
exit

:server_init
cd server
start UwAmp.exe
echo.
echo Starting EA login emulator and stats server...
echo.
timeout 10 >nul
start fesl_login_server -v -l 1 -dbhost 127.0.0.1 -dbname bf2142 -dbuser root -dbpass root
timeout 5 >nul

cd ..
cd local


:server_start
cls
echo. 
echo Battlefield 2142 Dedicated Server
echo. 
echo   1. Normal
rem echo   2. HD
echo. 
echo   3. No gameserver, only login emu
echo.
set /P wahl=Selection:  

if /i "%wahl%"=="1" goto mode_normal
rem if /i "%wahl%"=="2" goto mode_hd
if /i "%wahl%"=="3" goto end
goto server_start

:mode_normal
BF2142.exe +dedicated 1

:mode_hd
BF2142.exe +dedicated 1 +modPath mods/Project_Remaster_MP


:end
exit
