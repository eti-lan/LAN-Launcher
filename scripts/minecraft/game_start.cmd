cd local

set APPDATA=Appdata
cd /d %~dp0
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\java\bin\java.exe" profile=any enable=yes >nul

"java\bin\java.exe" -jar MinecraftSP.jar

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit