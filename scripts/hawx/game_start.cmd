set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

setlocal EnableDelayedExpansion
cd /d "%~dp0"

if %game_lang% equ de set lang_id=7
if %game_lang% equ en set lang_id=9
if %game_lang% equ de set lang_os=de
if %game_lang% equ en set lang_os=us

reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2" /v "language" /t REG_DWORD /d "%lang_id%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2" /v "OSlangID" /t REG_SZ /d "%lang_os%" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2" /v "Steam" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\1.0.0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\1.0.1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX11\GameUpdate" /v "execPath" /t REG_SZ /d "%game_path%\local\HAWX2_DX11.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX11\GameUpdate" /v "installdir" /t REG_SZ /d "%game_path%\local\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX11\GameUpdate" /v "info" /t REG_SZ /d "008ffaeb146040a695b784b0ffbbb932" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX9\GameUpdate" /v "execPath" /t REG_SZ /d "%game_path%\local\HAWX2.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX9\GameUpdate" /v "installdir" /t REG_SZ /d "%game_path%\local\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\UbiSoft\Tom Clancy's H.A.W.X. 2\GU_DX9\GameUpdate" /v "info" /t REG_SZ /d "008ffaeb146040a695b784b0ffbbb932" /f

cd local
"HAWX2_DX11.exe"
goto end


:end
exit