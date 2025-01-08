set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4
set reg_path=C:\Program Files (x86)\Ubisoft\Call of Juarez 2

echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"
robocopy /e "%CD%\local" "%reg_path%"

reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Call of Juarez - Bound in Blood\GameUpdate" /v "language" /t REG_SZ /d "%game_lang%" /f

copy /y "%reg_path%\CoJ2\Data\Game.ini.sample" "%reg_path%\CoJ2\Data\Game.ini"
cd local
"fnr.exe" --cl --silent --dir "%reg_path%\CoJ2\Data" --includeSubDirectories --fileMask "Game.ini" --useRegEx --useEscapeChars --find "LocaleXX" --replace "Locale(\"%game_lang%\")"

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="C:\Program Files (x86)\Ubisoft\Call of Juarez 2\CoJBiBGame_x86.exe" profile=any enable=yes >nul

cls
set __COMPAT_LAYER=WINXPSP3 DISABLEDWM
start /wait /affinity AA "" "C:\Program Files (x86)\Ubisoft\Call of Juarez 2\CoJBiBGame_x86.exe"


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit