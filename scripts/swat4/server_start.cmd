@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
cls

@echo off 
cls

:server
"Content\System\Swat4DedicatedServer.exe"

:end
exit