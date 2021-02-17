set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4


echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

taskkill /f /im steam.exe
cls

if %game_lang% == de (
	set lang_1=German
)

if %game_lang% == en (
	set lang_1=English
)

if %game_lang% == fr (
	set lang_1=French
)


reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%game_path%\local\iw4x.exe" /t REG_SZ /d "WIN8RTM RUNASADMIN" /f>nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\iw4x.exe" profile=any enable=yes>nul

:profile_fix
if exist "players\profile_fix.txt" (
    echo.
	echo Profile Patch - OK
	echo.
) else (
    del "players" /Q /S
	echo "" > "players\profile_fix.txt"
	cls
)


echo.
echo Do not close this window, it will be closed automatically!
echo.

:start
"iw4x.exe"


:end
netsh advfirewall firewall delete rule name="%game_id%">nul
del /f /q "updater.exe">nul
exit
