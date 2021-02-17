echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

regedit /s "install.reg"