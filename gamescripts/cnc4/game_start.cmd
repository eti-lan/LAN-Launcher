set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Data\CNC4.exe" profile=any enable=yes >nul


:lang
if %game_lang% == de (
	set lang=German
	goto de
)

if %game_lang% == en (
	set lang=English
	goto en
)

if %game_lang% == fr (
	set lang=French
	goto fr
)


:de
cls
echo.
echo Willkommen zu CNC4. Dieses Startprogramm ersetzt die Windows Hosts-Datei um die Verbindung
echo zum Emulator-Server herzustellen. echo Nach dem Spiel wird eine Sicherung der Datei wieder eingespielt.
echo.
echo.
set /p serverip=IP des CNC4-Servers (der Host muss 127.0.0.1 angeben):
goto runcnc4


:fr
cls
echo.
echo Ce lanceur remplace le fichier Windows Hosts par la connexion
echo au serveur d'émulation. Après le jeu, une sauvegarde du fichier est restaurée.
echo.
echo.
set /p serverip=IP du serveur CNC4:
goto runcnc4


:en
cls
echo.
echo This launcher replaces the Windows Hosts file with the connection
echo to the emulation server. After the game, a file backup is restored.
echo.
echo.
set /p serverip=CNC4 server IP:
goto runcnc4


:runcnc4
if %serverip% equ "" goto lang
echo %serverip% gosredirector.ea.com > hosts.src
echo %serverip% blazeserver.blazeemu.org >> hosts.src
echo %serverip% gosgvaprod-qos01.ea.com >> hosts.src
echo %serverip% gosiadprod-qos01.ea.com >> hosts.src
echo %serverip% gossjcprod-qos01.ea.com >> hosts.src
echo %serverip% demangler.ea.com >> hosts.src
echo %serverip% vmp.tools.gos.ea.com >> hosts.src

copy /y "%windir%\system32\drivers\etc\hosts" "%windir%\system32\drivers\etc\hosts.cnc4"
copy "hosts.src" "%windir%\system32\drivers\etc\hosts"

set min=1
set max=10
set /a playerid=min+(max-min+1)*%random%/32768
"Data\CNC4.exe" -config "..\CNC4_%lang%.SkuDef" -loginToken "player%playerid%@eti.lan|random" -persona "Spieler %playerid%"

copy /y "%windir%\system32\drivers\etc\hosts.cnc4" "%windir%\system32\drivers\etc\hosts"
del "%windir%\system32\drivers\etc\hosts.cnc4"


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
