cd local

set APPDATA=Appdata
cd /d %~dp0
cd local

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\java\bin\javaw.exe" profile=any enable=yes >nul

start "" java\bin\java.exe -Xmx1024M -Xms1024M -jar Minecraft_Server.jar -o true

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit