echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKLM\SOFTWARE\WOW6432Node\2K Games\Dungeon Siege 2 Broken World" /v "AppPath" /t REG_SZ /d "%~dp0\local" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\2K Games\Dungeon Siege 2 Broken World" /v "InstallationDirectory" /t REG_SZ /d "%~dp0\local" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Gas Powered Games\Dungeon Siege 2 Broken World\1.00.0000" /v "InstallLocation" /t REG_SZ /d "%~dp0\local" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Microsoft Games\DungeonSiege2" /v "AppPath" /t REG_SZ /d "%~dp0\local" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Microsoft Games\DungeonSiege2" /v "InstallationDirectory" /t REG_SZ /d "%~dp0\local" /f

for /f delims^= %%I in ('
	wmic.exe path Win32_VideoController get CurrentHorizontalResolution^,CurrentVerticalResolution^|findstr /b [0-9]
')do for /f tokens^=1-2 %%a in ('echo\%%I')do set "h=%%a" && set "w=%%b"

mkdir "%userprofile%\documents\My Games\Dungeon Siege 2 Broken World"
echo width = %h% > "%userprofile%\documents\My Games\Dungeon Siege 2 Broken World\DungeonSiege2BrokenWorld.ini"
echo height = %w% >> "%userprofile%\documents\My Games\Dungeon Siege 2 Broken World\DungeonSiege2BrokenWorld.ini"
echo bpp = 32 >> "%userprofile%\documents\My Games\Dungeon Siege 2 Broken World\DungeonSiege2BrokenWorld.ini"
echo oldschool = true >> "%userprofile%\documents\My Games\Dungeon Siege 2 Broken World\DungeonSiege2BrokenWorld.ini"

cd .
set "errorlevel=0"
exit /b 0