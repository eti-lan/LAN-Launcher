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
        "%programfiles%\eti\lan launcher\fnr.exe" --cl --silent --dir "%cd%" --fileMask "Nadeo.ini" --useRegEx --useEscapeChars --find "Language=.*" --replace "Language=de"
    )

if %game_lang% == en (
        "%programfiles%\eti\lan launcher\fnr.exe" --cl --silent --dir "%cd%" --fileMask "Nadeo.ini" --useRegEx --useEscapeChars --find "Language=.*" --replace "Language=en"
)

if %game_lang% == fr (
        "%programfiles%\eti\lan launcher\fnr.exe" --cl --silent --dir "%cd%" --fileMask "Nadeo.ini" --useRegEx --useEscapeChars --find "Language=.*" --replace "Language=fr"
)


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\TmForever.exe" profile=any enable=yes >nul

"TmForever.exe" /silent

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit