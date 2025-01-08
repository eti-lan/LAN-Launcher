@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
cls

@echo off 
:mainmenu 
cls
echo. 
echo Wreckfest LAN Server
echo. 
echo   1. Start
echo   2. Edit Config
echo   3. Exit
echo. 
set /P wahl=:  

if /i "%wahl%"=="1" goto:server
if /i "%wahl%"=="2" goto:config
if /i "%wahl%"=="3" exit
goto:mainmenu  

:server
start "" server\Wreckfest.exe -s server_config=server\server_config.cfg
echo Starting... this can take up to one minute!
timeout 30 >nul
exit

:config
notepad "server\server_config.cfg"
goto mainmenu

:end
exit