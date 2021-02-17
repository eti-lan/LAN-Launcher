echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

set wc3path="%userprofile%\Documents\Warcraft III\"
"%programfiles%\eti\lan launcher\unrar.exe" x -o -y "wc3_profile.eti" %wc3path%

reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Blizzard Entertainment\Warcraft III" /v "Migration Complete" /t REG_DWORD /d "1" /f