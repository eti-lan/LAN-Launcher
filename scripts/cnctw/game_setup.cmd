set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

reg.exe add "HKCU\Software\Electronic Arts\Command and Conquer 3" /v "InstallPath" /t REG_SZ /d "%game_path%\\local\\" /f
reg.exe add "HKCU\Software\Electronic Arts\Electronic Arts\Command and Conquer 3" /v "InstallPath" /t REG_SZ /d "%game_path%\\local\\" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3\ergc" /ve /t REG_SZ /d "18JAN33HFIGHTING4FUN" /f
reg.exe add "HKCU\Software\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "german" /f
reg.exe add "HKCU\Software\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "german" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Hash" /t REG_DWORD /d "382823914" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Version" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Readme" /t REG_SZ /d "{PATH}\readme.txt" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "InstallPath" /t REG_SZ /d "%game_path%\\local\\addon\\" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "ProfileFolderName" /t REG_SZ /d "Profiles" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "SaveFolderName" /t REG_SZ /d "SaveGames" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" /t REG_SZ /d "Command and Conquer 3 Kanes Wrath" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "ScreenshotsFolderName" /t REG_SZ /d "Screenshots" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "ReplayFolderName" /t REG_SZ /d "Replays" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "german" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Package" /t REG_SZ /d "{CC2422C9-F7B5-4175-B295-5EC2283AA674}" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "MapPackVersion" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UseLocalUserMaps" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Command and Conquer 3 Kanes Wrath\ergc" /ve /t REG_SZ /d "ZUJSXT7XL4YLTF7LYQ75" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Hash" /t REG_DWORD /d "382823914" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Version" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Readme" /t REG_SZ /d "{PATH}\readme.txt" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "InstallPath" /t REG_SZ /d "%game_path%\\local\\addon\\" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "ProfileFolderName" /t REG_SZ /d "Profiles" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "SaveFolderName" /t REG_SZ /d "SaveGames" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UserDataLeafName" /t REG_SZ /d "Command and Conquer 3 Kanes Wrath" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "ScreenshotsFolderName" /t REG_SZ /d "Screenshots" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "ReplayFolderName" /t REG_SZ /d "Replays" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Language" /t REG_SZ /d "german" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "Package" /t REG_SZ /d "{CC2422C9-F7B5-4175-B295-5EC2283AA674}" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "MapPackVersion" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Command and Conquer 3 Kanes Wrath" /v "UseLocalUserMaps" /t REG_DWORD /d "0" /f

start "" "..\cnctw_maps.exe"
"EA Multi Keygen.exe"