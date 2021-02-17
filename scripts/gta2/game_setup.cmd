echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

regedit.exe /s "gta2_install.reg"