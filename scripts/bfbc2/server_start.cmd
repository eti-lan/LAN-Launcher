rem BFBC2 - Server 
@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls
rmdir "server/gameserver" /s /q
rmdir "server/procon" /s /q
cls

echo This Server version is out of date
echo.
echo Server is Replace by a stand alone one "Battlefield Server"
echo.	
echo Please Backup Userdata
echo Folder BFBC2-EMU\database
echo.
echo.
echo Open database storage location
echo.
echo.
explorer "server\masterserver\win32"

pause
goto exit

:exit 
exit
