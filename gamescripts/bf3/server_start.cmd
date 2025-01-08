rem BF3 - Server 
@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cls
rmdir "server/gameserver" /s /q
rmdir "server/masterserver" /s /q
rmdir "server/procon" /s /q
cls

echo This Server version is out of date
echo Server is Replace by a stand alone one "Battlefield Server"
echo.	
echo BF3/BF4 Please Backup Userdata via phpmyadmin
echo http://localhost/phpmyadmin
echo SQL user: bf3 Password: bf3lan 
echo SQL (bf4\users, bf3\player*)
echo.
echo.
echo Starting webserver for backup
cd server
start webserver\usbwebserver.exe

pause
goto exit

:exit 
exit
