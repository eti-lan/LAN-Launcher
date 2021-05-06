echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

"Language Selector.exe"
taskkill /f /im "Anno1701.exe"

cd .
set "errorlevel=0"
exit /b 0