@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
cls

@echo off 
cls

:server
"bin64\sauerbraten.exe" -d %*


:end
exit