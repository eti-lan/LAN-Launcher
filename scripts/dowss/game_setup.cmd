set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4
set game_lpath=%game_path:\=\\%

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War" /v "CDKEY" /t REG_SZ /d "000e-a1f1-19d7-69f5" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War" /v "InstallLocation" /t REG_SZ /d "%game_lpath%\\local\\Unlocker\\Classic and Winter Assault\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War" /v "CDKEY_WXP" /t REG_SZ /d "10a3-064f-2c8b-b8c8-4c8a" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War - Dark Crusade" /v "CDKEY" /t REG_SZ /d "76c0-6973-cf45-9954-b935" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War - Dark Crusade" /v "InstallLocation" /t REG_SZ /d "%game_lpath%\\local\\Unlocker\\Dark Crusade\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War - Soulstorm" /v "CDKEY" /t REG_SZ /d "4eb6-b754-37d4-9ce3-dd10" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War - Soulstorm" /v "InstallLocation" /t REG_SZ /d "%game_lpath%\\local\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War - Soulstorm" /v "W40KCDKEY" /t REG_SZ /d "000e-a1f1-19d7-69f5" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War - Soulstorm" /v "WXPCDKEY" /t REG_SZ /d "10a3-064f-2c8b-b8c8-4c8a" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War - Soulstorm" /v "DXP2CDKEY" /t REG_SZ /d "76c0-6973-cf45-9954-b935" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\THQ\Dawn of War - Soulstorm\1.00.0000" /f
