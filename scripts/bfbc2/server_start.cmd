rem BFBC2 - Server 
@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls

if exist "server" (
    goto:mainmenu
) else (
    goto:server_setup
)

exit

@echo off

set drive=%~d0

:mainmenu
cd "%drive%\LAN\bfbc2"
cls
echo. 
echo Battlefield: Bad Company 2 Server
echo. 
echo   1. Start Masterserver  
echo   2. Change Masterserver Config
echo   3. Start Gameserver 
echo   4. Quit 
echo. 
set /P selection=Selection:  

if /i "%selection%"=="1" goto:masterserver
if /i "%selection%"=="2" goto:configserver
if /i "%selection%"=="3" goto:gameserver
if /i "%selection%"=="4" goto:exit
echo Wrong Selection! 
goto:mainmenu  

:masterserver
cd "%drive%\LAN\bfbc2\server\masterserver\win32\"
start mase_bc2.exe
cd "%drive%\LAN\bfbc2\server\procon\"
start PRoCon.exe
goto:mainmenu  

	:gameserver
	:Selection-gameserver
	cls
	echo. 
	echo Battlefield: Bad Company 2 Server
	echo. 
	echo   1. Start Ranked Server
	echo   2. Start Unranked Server      
	echo   3. Start all Server
	echo   4. Back to Mainmenu
	echo. 
	set /P selection=Selection:  

	if /i "%selection%"=="1" goto:ranked
	if /i "%selection%"=="2" goto:unranked
	if /i "%selection%"=="3" goto:all
	if /i "%selection%"=="4" goto:mainmenu

	echo Wrong Selection! 
	goto:Selection-gameserver 
	
	:ranked
	cd server
	cd gameserver
	cls
	echo. 
	echo Battlefield: Bad Company 2 Server
	echo. 
	echo   1. Start Ranked Server 
	echo   2. Start Ranked Server (Vietnam) 
	echo   3. Back to Gameserver Menu
	echo. 
	set /P selection=Selection:  

	if /i "%selection%"=="1" goto:server-bc
	if /i "%selection%"=="2" goto:server-bc-viet
	if /i "%selection%"=="3" goto:mainmenu

	echo Wrong Selection! 
	goto:Selection-gameserver
	
	:server-bc
	start #ranked.bat
	goto:ranked
	
	:server-bc-viet
	start #ranked-vietnam.bat
	goto:ranked
	
	
	:unranked
	cd server
	cd gameserver
	cls
	echo. 
	echo Battlefield: Bad Company 2 Server
	echo. 
	echo   1. Start Unranked Server 
	echo   2. Start Unranked Server (Vietnam) 
	echo   3. Back to Gameserver Menu
	echo. 
	set /P selection=Selection:  

	if /i "%selection%"=="1" goto:server-unranked
	if /i "%selection%"=="2" goto:server-unranked-viet
	if /i "%selection%"=="3" goto:mainmenu

	echo Wrong Selection! 
	goto:Selection-gameserver
	
	:server-unranked
	start #unranked.bat
	goto:unranked
	
	:server-unranked-viet
	start #unranked-vietnam.bat
	goto:unranked
	
	
	:all
	cd server
	cd gameserver
	start #ranked.bat
	timeout 2
	start #unranked.bat
	timeout 2
	start #ranked-vietnam.bat
	timeout 2
	start #unranked-vietnam.bat
	timeout 2
	
	goto:mainmenu
	
	
		:configserver 
		@echo off 
		:Selection-config
		cls
		echo. 
		echo Battlefield: Bad Company 2 Server Config
		echo. 
		echo   1. Change Masterserver IP
		echo   2. Back to Mainmenu
		echo. 
		set /P selection=Selection:  

		if /i "%selection%"=="1" goto:masterserver-ip
		if /i "%selection%"=="2" goto:mainmenu

		echo Wrong Selection! 
		goto:Selection-config

		:masterserver-ip
		set /P IP=Enter IP-Address (Example.: 192.168.178.1):
		set drive=%~d0
		"%programfiles%\eti\lan launcher\fnr.exe" --cl --silent --dir "%drive%\LAN\bfbc2\server\masterserver\win32" --fileMask "config.ini" --includeSubDirectories --useRegEx --useEscapeChars --find "^emulator_ip = .*" --replace "emulator_ip = %IP%"
		"%programfiles%\eti\lan launcher\fnr.exe" --cl --silent --dir "%drive%\LAN\bfbc2\server\gameserver" --fileMask "bfbc2.ini" --includeSubDirectories --useRegEx --useEscapeChars --find "^host=.*" --replace "host=%IP%"
		goto:mainmenu


:exit 
exit

:server_setup
"server_setup.exe"
timeout 5
goto mainmenu
exit

exit
