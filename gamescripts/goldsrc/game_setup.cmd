echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
cd hl-cs15

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0\local\hl-cs15\hl.exe" /d "~ WINXPSP2" /f
reg.exe add "HKCU\SOFTWARE\Valve\Half-Life\Settings" /v "Key" /t REG_SZ /d "4453759699167" /f

start "" "cs15resolution.exe"