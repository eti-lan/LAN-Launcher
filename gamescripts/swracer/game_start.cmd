set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4
set reg_path=%CD:~0,2%\\LAN\\swracer\\local

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local


reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "3D Device" /t REG_SZ /d "Microsoft Direct3D Hardware acceleration through Direct3D HAL" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Analyze Path" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "CD Path" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "DevMode" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Display Height" /t REG_DWORD /d "768" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Display Width" /t REG_DWORD /d "1024" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Display" /t REG_SZ /d "Primary Display Driver" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Executable" /t REG_SZ /d "%reg_path%\\SWEP1RCR.EXE" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Fix Flicker" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "FullScreen" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "GUID" /t REG_SZ /d "{00000000-0000-0000-0000-000000000000}" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Install Path" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "InstallType" /t REG_DWORD /d "9" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "JoystickID" /t REG_SZ /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Source Dir" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "Source Path" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\LucasArts Entertainment Company LLC\Star Wars: Episode I Racer\v1.0" /v "UseFett" /t REG_DWORD /d "0" /f

reg.exe Add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%game_path%\local\SWEP1RCR.EXE" /d "~ DWM8And16BitMitigation DISABLETHEMES DISABLEDWM" /f
reg.exe Add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%game_path%\local\SWEP1RCR.EXE" /d "~ DWM8And16BitMitigation DISABLETHEMES DISABLEDWM" /f

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\SWEP1RCR.exe" profile=any enable=yes >nul

cls
start /wait dgvoodooCpl.exe
start /wait /affinity 1 SWEP1RCR.exe -i

:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit