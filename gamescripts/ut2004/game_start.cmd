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
        "fnr.exe" --cl --silent --dir "%cd%\System" --fileMask "UT2004.ini" --useRegEx --useEscapeChars --find "Language=.*" --replace "Language=det"
)

if %game_lang% == en (
        "fnr.exe" --cl --silent --dir "%cd%\System" --fileMask "UT2004.ini" --useRegEx --useEscapeChars --find "Language=.*" --replace "Language=int"
)

if %game_lang% == fr (
        "fnr.exe" --cl --silent --dir "%cd%\System" --fileMask "UT2004.ini" --useRegEx --useEscapeChars --find "Language=.*" --replace "Language=frt"
)


"fnr.exe" --cl --silent --dir "%cd%\System" --fileMask "UT2004.ini" --useRegEx --useEscapeChars --find "Name=.*" --replace "Name=%player%"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\system\UT2004.exe" profile=any enable=yes >nul

cls
cd system

"UT2004.exe"


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit

