set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4
set reg_path=%CD:~0,2%\\LAN\\futurecop\\local

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local


reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "Install Dir" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "PlayerName" /t REG_SZ /d "%player%" /f

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\FCopLAPD.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Ip.exe" profile=any enable=yes >nul

powershell -command mount-diskimage -imagepath '%game_path%\local\future cop.iso'
timeout 3 >nul

cls
set __COMPAT_LAYER=WIN98 16BitColor
"FCopLAPD.exe"

:end
powershell -command dismount-diskimage -imagepath '%game_path%\local\future cop.iso'
netsh advfirewall firewall delete rule name="%game_id%" >nul

exit