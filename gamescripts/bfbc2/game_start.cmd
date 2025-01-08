set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4
set "masterserver=bfbc2.servers.lan"

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local


if %game_lang% == de (
	set locale=DE
	set lang=German
)

if %game_lang% == en (
	set locale=EN
	set lang=English
)

if %game_lang% == fr (
	set locale=FR
	set lang=French
)

reg.exe add "HKLM\SOFTWARE\Electronic Arts\Battlefield Bad Company 2" /v "Locale" /t REG_SZ /d "%locale%" /f
reg.exe add "HKLM\SOFTWARE\Electronic Arts\Battlefield Bad Company 2" /v "Language" /t REG_SZ /d "%lang%" /f
reg.exe add "HKLM\SOFTWARE\Electronic Arts\Battlefield Bad Company 2\1.0" /v "LanguageName" /t REG_SZ /d "%lang%" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Battlefield Bad Company 2" /v "Locale" /t REG_SZ /d "%locale%" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Battlefield Bad Company 2" /v "Language" /t REG_SZ /d "%lang%" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Battlefield Bad Company 2\1.0" /v "LanguageName" /t REG_SZ /d "%lang%" /f
cls
:check_masterserver
ping %masterserver% -n 1 -4 | find /i "TTL=" >nul
if errorlevel 1 goto changeIP
if errorlevel 0 goto start

:changeIP
set drive=%~d0
set /P masterserver=Enter Battlefield BC2 Masterserver IP-Address (Example.: 192.168.178.1):
"%programfiles%\eti\lan launcher\fnr.exe" --cl --silent --dir "%drive%\LAN\bfbc2\local" --fileMask "bfbc2.ini" --includeSubDirectories --useRegEx --useEscapeChars --find "^host=.*" --replace "host=%masterserver%"
goto check_masterserver

:start
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\BFBC2Game.exe" profile=any enable=yes >nul

"BFBC2Game.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul
goto end

:end
exit
