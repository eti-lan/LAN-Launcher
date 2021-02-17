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
	set lang_1=German
	set lang_2=de_DE
)

if %game_lang% == en (
	set lang_1=English
	set lang_2=en_US
)

if %game_lang% == fr (
	set lang_1=French
	set lang_2=fr_FR
)


:game_menu
cls
echo. 
echo Battlefield 2142
echo. 
echo.
set /p ip=EMU Server IP-Address (Bsp.: 192.168.178.1):
rem echo   1. Normal    (Stable)
rem echo   2. HD        (Project Remaster, unstable)
echo. 
echo.

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\bf2142.exe" profile=any enable=yes >nul

reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Battlefield 2142" /v "Language" /t REG_SZ /d "%lang_1%" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Battlefield 2142" /v "Locale" /t REG_SZ /d "%lang_2%" /f

echo %ip% bf2142-pc.fesl.ea.com > hosts.src
echo %ip% gpcm.gamespy.com >> hosts.src
echo %ip% stella.available.gamespy.com >> hosts.src
echo %ip% eapusher.dise.se >> hosts.src
echo %ip% stella.prod.gamespy.com >> hosts.src
echo %ip% stella.ms5.gamespy.com >> hosts.src
echo %ip% ea.com >> hosts.src
echo %ip% gamespy.com >> hosts.src
echo %ip% messaging.ea.com >> hosts.src
echo %ip% fesl.ea.com >> hosts.src
echo %ip% gpsp.gamespy.com >> hosts.src
echo %ip% gamestats.gamespy.com >> hosts.src
echo %ip% stella.ms5.gamespy.com >> hosts.src
echo %ip% eapusher.dice.se >> hosts.src

copy /y "%windir%\system32\drivers\etc\hosts" "%windir%\system32\drivers\etc\hosts.etibak"
copy "hosts.src" "%windir%\system32\drivers\etc\hosts"


rem set /P wahl=Selection:  

rem if /i "%wahl%"=="1" goto mode_normal
rem if /i "%wahl%"=="2" goto mode_remaster
goto mode_normal
rem goto game_menu


reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%game_path%\local\bf2142.exe" /t REG_SZ /d "WIN7RTM RUNASADMIN" /f

:start
:mode_normal
"bf2142.exe" +menu 1 +fullscreen 1 +widescreen 1
goto end

:mode_remaster
"bf2142.exe" +menu 1 +fullscreen 1 +widescreen 1 +modPath mods/Project_Remaster_MP
goto end


:end
copy /y "%windir%\system32\drivers\etc\hosts.etibak" "%windir%\system32\drivers\etc\hosts"
del "%windir%\system32\drivers\etc\hosts.etibak"
del "hosts.src"
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
