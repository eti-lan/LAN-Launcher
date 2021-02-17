set game_path=%1
set game_id=%2

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TrendyEntertainment\DungeonDefenders" /v "BinaryPath" /t REG_SZ /d "%game_path%\\local\\Binaries\\Win32" /f
reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\TrendyEntertainment\DungeonDefenders" /v "InstalledUE3Redist" /t REG_DWORD /d "1" /f