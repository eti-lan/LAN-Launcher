set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

if %game_lang% == de (
reg.exe add "HKCU\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "german" /f
reg.exe add "HKCU\Software\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "german" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "german" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "german" /f

)

if %game_lang% == en (
reg.exe add "HKCU\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "english" /f
reg.exe add "HKCU\Software\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "english" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "english" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "english" /f
)

if %game_lang% == fr (
reg.exe add "HKCU\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "french" /f
reg.exe add "HKCU\Software\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "french" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "french" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "french" /f
)

cls
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\addon\cnc3ep1.exe" profile=any enable=yes >nul

"addon\cnc3ep1.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit