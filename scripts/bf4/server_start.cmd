rem BF4 - Server 
@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls

if exist "server" (
    goto server_update_check
) else (
    goto server_setup
)


exit

@echo off 
:mainmenu 
cls
cd server
start "" "PortableBF.exe"

:exit 
exit

:server_setup
"server-setup.exe"
timeout 5
goto mainmenu
exit


:server_update_check
if exist "server/update1.txt" (
    goto mainmenu
) else (
    goto server_update
)

:server_update
echo Update BF-Server #1
echo.	
echo All data will be removed. Please Backup Userdata via phpmyadmin
echo SQL user: root Password: root 
echo SQL (bf4\users, bf3\player*)
echo Folder BFBC2-EMU\database
echo.
pause
echo.
echo Deleting old server files
rmdir server /s /q
echo.
echo Starting server setup
"server-setup.exe"
timeout 5
goto mainmenu
exit

exit