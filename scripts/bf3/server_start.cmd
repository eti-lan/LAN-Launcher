rem BF3 - Server 
@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls

if exist "server" (
    goto mainmenu
) else (
    goto server_setup
)

exit

@echo off 
:mainmenu 
cls
echo. 
echo Battlefield 3 Server
echo. 
echo   1. Masterserver starten 
echo   2. Gameserver starten 
echo   3. Server konfigurieren
echo   4. Beenden 
echo. 
set /P wahl=Auswahl:  

if /i "%wahl%"=="1" goto:masterserver
if /i "%wahl%"=="2" goto:gameserver
if /i "%wahl%"=="3" goto:configserver
if /i "%wahl%"=="4" goto:exit
echo Falsche Auswahl! 
goto:mainmenu  

:masterserver
cd server
start webserver\usbwebserver.exe
start masterserver\BlazeServer.exe
start procon\PRoCon.exe
goto:mainmenu  

	:gameserver
	:auswahl-gameserver
	cls
	echo. 
	echo Battlefield 3 Server
	echo. 
	echo   1. Conquest Server starten
	echo   2. Rush Server starten 
	echo   3. TDM Server starten 
	echo   4. Unranked Server starten  
	echo   5. Alle Server starten 
	echo   6. ZurÅck zum HauptmenÅ
	echo. 
	set /P wahl=Auswahl:  

	if /i "%wahl%"=="1" goto:conquest
	if /i "%wahl%"=="2" goto:rush
	if /i "%wahl%"=="3" goto:tdm
	if /i "%wahl%"=="4" goto:unranked
	if /i "%wahl%"=="5" goto:startall
	if /i "%wahl%"=="6" goto:mainmenu

	echo Falsche Auswahl! 
	goto:auswahl-gameserver 
	
	:conquest
	cd gameserver
	start 1.bat
	goto:auswahl-gameserver 
	
	:rush
	cd gameserver
	start 2.bat
	goto:auswahl-gameserver 
	
	:tdm
	cd gameserver
	start 3.bat
	goto:auswahl-gameserver 
	
	:unranked
	cd gameserver
	start 4.bat
	goto:auswahl-gameserver 
	
	:startall
	cd gameserver
	start 1.bat
	start 2.bat
	start 3.bat
	start 4.bat
	goto:auswahl-gameserver 
	
	:mainmenu
	goto:mainmenu


		:configserver 
		@echo off 
		:auswahl-config
		cls
		echo. 
		echo Battlefield 3 Server Config
		echo. 
		echo   1. Masterserver IP Ñndern
		echo   2. Windows 10 Patch(SSPI Error) - Reboot erforderlich
		echo   3. Windows 10 Patch entfernen  - Reboot erforderlich
		echo   4. ZurÅck zum HauptmenÅ
		echo. 
		set /P wahl=Auswahl:  

		if /i "%wahl%"=="1" goto:masterserver-ip
		if /i "%wahl%"=="2" goto:patch
		if /i "%wahl%"=="3" goto:patch-remove
		if /i "%wahl%"=="4" goto:mainmenu

		echo Falsche Auswahl! 
		goto:auswahl-config

		:masterserver-ip
		set /P IP=Einagbe IP-Adresse (Bsp.: 192.168.178.1):
		set laufwerk=%~d0
		cd server
		"fnr.exe" --cl --silent --dir "%laufwerk%\LAN\bf3\server\masterserver\conf" --fileMask "conf.txt" --includeSubDirectories --useRegEx --useEscapeChars --find "^Redihost=.*" --replace "Redihost=%IP%"
		"fnr.exe" --cl --silent --dir "%laufwerk%\LAN\bf3\server\webserver\root" --fileMask "config.cfg" --includeSubDirectories --useRegEx --useEscapeChars --find "^hostIP-localPlayer=.*" --replace "hostIP-localPlayer=%IP%"
		"fnr.exe" --cl --silent --dir "%laufwerk%\LAN\bf3\server\webserver\root" --fileMask "config.cfg" --includeSubDirectories --useRegEx --useEscapeChars --find "^hostIP-externPlayer=.*" --replace "hostIP-externPlayer=%IP%"
		goto:auswahl-config

		:patch
		REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002" /v Functions /t REG_SZ /d "TLS_RSA_WITH_RC4_128_SHA,TLS_RSA_WITH_RC4_128_M"
		goto:auswahl-config
		
		:patch-remove
		REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Cryptography\Configuration\SSL\00010002" /v Functions
		goto:auswahl-config
		

:exit 
exit

:server_setup
"bf3_server.exe"
timeout 5
goto mainmenu
exit

exit