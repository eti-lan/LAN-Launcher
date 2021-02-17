set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4
set reg_path=C:\\Program Files (x86)\\Ubisoft\\Tom Clancy's H.A.W.X 2

echo off
setlocal EnableDelayedExpansion
cd /d "%~dp0"
robocopy /e "%CD%\local" "%reg_path%"

if %game_lang% equ de set lang_id=7
if %game_lang% equ en set lang_id=9
if %game_lang% equ de set lang_os=de
if %game_lang% equ en set lang_os=us

reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2" /v "language" /t REG_DWORD /d "%lang_id%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2" /v "OSlangID" /t REG_SZ /d "%lang_os%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2" /v "Steam" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2" /v "execPath" /t REG_SZ /d "%reg_path%\\HAWX2_DX11.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2" /v "installdir" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\1.0.0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\1.0.1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX11\GameUpdate" /v "execPath" /t REG_SZ /d "%reg_path%\\HAWX2_DX11.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX11\GameUpdate" /v "installdir" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX11\GameUpdate" /v "info" /t REG_SZ /d "008ffaeb146040a695b784b0ffbbb932" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX9\GameUpdate" /v "execPath" /t REG_SZ /d "%reg_path%\\HAWX2.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX9\GameUpdate" /v "installdir" /t REG_SZ /d "%reg_path%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX9\GameUpdate" /v "info" /t REG_SZ /d "008ffaeb146040a695b784b0ffbbb932" /f

netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="C:\Program Files (x86)\Ubisoft\Tom Clancy's H.A.W.X 2\HAWX2_DX11.exe" profile=any enable=yes >nul

cd local
cls
echo.
echo Start the game with the modified SKIDROW Uplay.
echo.
echo WARNING: Do not close this window, it will be closed automatically.
"C:\Program Files (x86)\Ubisoft\Tom Clancy's H.A.W.X 2\HAWX2_DX11.exe"
timeout /t 20 /nobreak >nul 2>&1

:LOOP
tasklist | find /i "Uplay" >nul 2>&1
IF ERRORLEVEL 1 (
  GOTO END
) ELSE (
  timeout /t 10 /nobreak >nul 2>&1
  GOTO LOOP
)


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit