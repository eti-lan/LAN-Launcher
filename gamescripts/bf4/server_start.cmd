rem BF4 - Server 
@echo off 
setlocal EnableDelayedExpansion
cd /d "%~dp0"

cls
rmdir "server/Battlefield_3_Server" /s /q
rmdir "server/Battlefield_4_Server" /s /q
rmdir "server/BF3-EMU" /s /q
rmdir "server/BF4-EMU" /s /q
rmdir "server/BFBC2_PC_SERVER_R34" /s /q
rmdir "server/BFBC2-EMU" /s /q
rmdir "server/Client-Files" /s /q
rmdir "server/DirectX - VC++ 2015, 2013, 2012, 2010" /s /q
rmdir "server/procon_1.5.1.1" /s /q
rmdir "server/Redirector" /s /q
cls

echo This Server version is out of date
echo Server is Replace by a stand alone one "Battlefield Server"
echo.	
echo BF3/BF4 Please Backup Userdata via phpmyadmin
echo http://localhost/phpmyadmin
echo SQL user: root Password: root 
echo SQL (bf4\users, bf3\player*)
echo.
echo.
echo Starting webserver for backup
cd server\Xampp

start "" "xampp-control.exe"
start "" "http://localhost/phpmyadmin"
Pause
goto exit

:exit 
exit


