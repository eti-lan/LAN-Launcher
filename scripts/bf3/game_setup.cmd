set game_path=%1
set game_id=%2

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKLM\SOFTWARE\Classes\bf3lan" /ve /t REG_SZ /d "URL:bf3lan Protocol" /f
reg.exe add "HKLM\SOFTWARE\Classes\bf3lan" /v "URL Protocol" /t REG_SZ /d "" /f
reg.exe add "HKLM\SOFTWARE\Classes\bf3lan\shell\open\command" /ve /t REG_SZ /d "%game_path%\\local\\BF34Launcher.exe %%1" /f

timeout 5