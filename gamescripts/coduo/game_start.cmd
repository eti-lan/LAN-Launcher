set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local


if %game_lang% == de (
	set lang=2
	copy /y "language\de\uo\*.*" uo\
	copy /y "language\de\main\*.*" main\
)

if %game_lang% == en (
	set lang=1
	copy /y  "language\en\uo\*.*" uo\
	copy /y  "language\en\main\*.*" main\
)

if %game_lang% == fr (
	set lang=3
	copy /y  "language\fr\uo\*.*" uo\
	copy /y  "language\fr\main\*.*" main\
)


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\CoDUOMP.exe" profile=any enable=yes >nul

reg.exe add "HKLM\SOFTWARE\WOW6432Node\Activision\Call of Duty United Offensive" /v "Language" /t REG_SZ /d "%lang%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Activision\Call of Duty United Offensive" /v "Version" /t REG_SZ /d "1.15" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Activision\Call of Duty United Offensive" /v "InstallPath" /t REG_SZ /d "%game_path%" /f
reg.exe add "HKLM\SOFTWARE\Activision\Call of Duty United Offensive" /v "Language" /t REG_SZ /d "%lang%" /f
reg.exe add "HKLM\SOFTWARE\Activision\Call of Duty United Offensive" /v "Version" /t REG_SZ /d "1.15" /f
reg.exe add "HKLM\SOFTWARE\Activision\Call of Duty United Offensive" /v "InstallPath" /t REG_SZ /d "%game_path%" /f

cd uo

"%programfiles%\eti\LAN Launcher\fnr.exe" --cl --silent --dir "%cd%" --fileMask "uoconfig_mp.cfg" --useRegEx --useEscapeChars --find "seta name.*" --replace "seta name \"%player%\""

cd..
cls
"CoDUOMP.exe"


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit