echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

regedit /s "install.reg"