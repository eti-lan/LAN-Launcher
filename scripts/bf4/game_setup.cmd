set game_path=%1
set game_id=%2

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKLM\SOFTWARE\Classes\bf4lan" /ve /t REG_SZ /d "URL:bf4lan Protocol" /f
reg.exe add "HKLM\SOFTWARE\Classes\bf4lan" /v "URL Protocol" /t REG_SZ /d "" /f
reg.exe add "HKLM\SOFTWARE\Classes\bf4lan\shell\open\command" /ve /t REG_SZ /d "%game_path%\\local\\BF34Launcher.exe %%1" /f

timeout 5