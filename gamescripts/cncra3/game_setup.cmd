set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "DisplayName" /t REG_SZ /d "Command & ConquerÃ¢â€žÂ¢ Red AlertÃ¢â€žÂ¢ 3" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "ProductName" /t REG_SZ /d "Command & ConquerÃ¢â€žÂ¢ Red AlertÃ¢â€žÂ¢ 3" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Install Dir" /t REG_SZ /d "%game_path%\\local\\" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Locale" /t REG_SZ /d "en_US" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Language" /t REG_SZ /d "English (US)" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Patch URL" /t REG_SZ /d "http://www.ea.com/redalert" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Product GUID" /t REG_SZ /d "{296D8550-CB06-48E4-9A8B-E5034FB64715}" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Suppression Exe" /t REG_SZ /d "" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Registration" /t REG_SZ /d "Software\Electronic Arts\Electronic Arts\Red Alert 3\ergc" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Readme" /t REG_SZ /d "PATH\Support\readme.txt" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "UseLocalUserMaps" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "UserDataLeafName" /t REG_SZ /d "Red Alert 3" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "ScreenshotsFolderName" /t REG_SZ /d "Screenshots" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "ReplayFolderName" /t REG_SZ /d "Replays" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "ProfileFolderName" /t REG_SZ /d "Profiles" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "SaveFolderName" /t REG_SZ /d "SaveGames" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.12" /v "DisplayName" /t REG_SZ /d "Red Alert 3" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.12" /v "Language" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.12" /v "LanguageName" /t REG_SZ /d "English (US)" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\ergc" /ve /t REG_SZ /d "CDKEY" /f
