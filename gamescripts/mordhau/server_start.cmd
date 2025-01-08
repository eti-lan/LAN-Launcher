setlocal EnableDelayedExpansion
cd /d "%~dp0"
echo off

if exist "server" (
    goto server_start
) else (
    goto server_setup
)

exit

:server_start
pushd server
start "" "MordhauServer.exe" FFA_ThePit -log -port=7777 -queryport=27015

cls
echo.
echo Starting Mordhau dedicated server...
timeout 5 /nobreak >nul
exit

:server_setup
"mordhau_server.exe"
timeout 5
goto server_start
exit