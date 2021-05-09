setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

cls

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%~dp0\local\eduke32.exe" profile=any enable=yes >nul
"eduke32.exe" -server










