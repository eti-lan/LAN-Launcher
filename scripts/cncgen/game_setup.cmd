set game_path=%1
set game_id=%2

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Generals" /v "InstallPath" /t REG_SZ /d "%game_path%\\local\\" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Generals" /v "MapPackVersion" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Generals" /v "Version" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Generals\ergc" /ve /t REG_SZ /d "1842146827383645571735" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "UserDataLeafName" /t REG_SZ /d "Command and Conquer Generals Zero Hour Data" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "Version" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "MapPackVersion" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "InstallPath" /t REG_SZ /d "%game_path%\\local\\ZeroHour\\" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour\ergc" /ve /t REG_SZ /d "PDWWHYA4TPQDT8KTZC3J" /f

"cncgenuserdata.exe"
cd local
"Keygen.exe"
