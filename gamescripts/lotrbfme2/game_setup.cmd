set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

set confdir=My The Lord of the Rings, The Rise of the Witch-king Files
set game_lpath=%game_path:\=\\%

chcp 65001 
echo off
cls
setlocal EnableDelayedExpansion

cd /d "%~dp0"
"game_appdata.exe"

pushd %appdata%
if not exist "%confdir%" md "%confdir%"
cd "%confdir%"
if not exist "Maps" md Maps
if not exist "Replays" md Replays

copy /y "%game_path%\local\options.ini" .
popd


reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2.exe" /ve /t REG_SZ /d "%game_lpath%\\local\\lotrbfme2.exe" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2.exe" /v "DirectX Installed" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2.exe" /v "Game Registry" /t REG_SZ /d "SOFTWARE\Electronic Arts\The Battle for Middle-earth II" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2.exe" /v "Installed" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2.exe" /v "Path" /t REG_SZ /d "%game_lpath%\\local\\" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2.exe" /v "Restart" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2ep1.exe" /ve /t REG_SZ /d "%game_lpath%\\local\\EP1\\lotrbfme2ep1.exe" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2ep1.exe" /v "DirectX Installed" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2ep1.exe" /v "Game Registry" /t REG_SZ /d "SOFTWARE\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2ep1.exe" /v "Installed" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2ep1.exe" /v "Path" /t REG_SZ /d "%game_lpath%\\local\\EP1\\" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\lotrbfme2ep1.exe" /v "Restart" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "InstallPath" /t REG_SZ /d "%game_lpath%\\local\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "MapPackVersion" /t REG_DWORD /d "65536" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "UseLocalUserMaps" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "UserDataLeafName" /t REG_SZ /d "My The Lord of the Rings, The Rise of the Witch-king Files" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "Version" /t REG_DWORD /d "65542" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II\ergc" /ve /t REG_SZ /d "QGHHGC9LS8FPQN57Y9YN" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "InstallPath" /t REG_SZ /d "%game_lpath%\\local\\EP1\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "MapPackVersion" /t REG_DWORD /d "131072" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "UseLocalUserMaps" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "UserDataLeafName" /t REG_SZ /d "My The Lord of the Rings, The Rise of the Witch-king Files" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Version" /t REG_DWORD /d "131073" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\ergc" /ve /t REG_SZ /d "3QCUXRQ8VLDPS4EKA2D2" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "CacheSize" /t REG_SZ /d "5499066368" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "CD Drive" /t REG_SZ /d "I:\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "DisplayName" /t REG_SZ /d "The Battle for Middle-earth (tm) II" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Install Dir" /t REG_SZ /d "%game_lpath%\\local\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Installed From" /t REG_SZ /d "I:\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Locale" /t REG_SZ /d "de" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Patch URL" /t REG_SZ /d "http://transtest.ea.com/Electronic Arts/The Battle for Middle-earth 2/NorthAmerica" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Product GUID" /t REG_SZ /d "{2A9F95AB-65A3-432c-8631-B8BC5BF7477A}" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Region" /t REG_SZ /d "NorthAmerica" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Registration" /t REG_SZ /d "SOFTWARE\Electronic Arts\Electronic Arts\The Battle for Middle-earth II\ergc" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Suppression Exe" /t REG_SZ /d "rtsi.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "SwapSize" /t REG_SZ /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "DisplayName" /t REG_SZ /d "The Battle for Middle-earth (tm) II" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "Language" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "LanguageName" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "CacheSize" /t REG_SZ /d "3139187712" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "CD Drive" /t REG_SZ /d "I:\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "DisplayName" /t REG_SZ /d "Rise of the Witch-king" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Install Dir" /t REG_SZ /d "%game_lpath%\\local\\EP1\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Installed From" /t REG_SZ /d "I:\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Locale" /t REG_SZ /d "de" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Patch URL" /t REG_SZ /d "http://transtest.ea.com/Electronic Arts/The Battle for Middle-earth 2/NorthAmerica" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Product GUID" /t REG_SZ /d "{B931FB80-537A-4600-00AD-AC5DEDB6C25B}" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Region" /t REG_SZ /d "NorthAmerica" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Registration" /t REG_SZ /d "SOFTWARE\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\ergc" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Suppression Exe" /t REG_SZ /d "rtsi.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "SwapSize" /t REG_SZ /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "DisplayName" /t REG_SZ /d "Rise of the Witch-king" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "Language" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "LanguageName" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2A9F95AB-65A3-432c-8631-B8BC5BF7477A}" /v "DisplayIcon" /t REG_SZ /d "%game_lpath%\\local\\LotRIcon.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2A9F95AB-65A3-432c-8631-B8BC5BF7477A}" /v "DisplayName" /t REG_SZ /d "The Battle for Middle-earth (tm) II" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2A9F95AB-65A3-432c-8631-B8BC5BF7477A}" /v "FriendlyName" /t REG_SZ /d "The Battle for Middle-earth (tm) II" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2A9F95AB-65A3-432c-8631-B8BC5BF7477A}" /v "LogFile" /t REG_SZ /d "%game_lpath%\\local\\filelist.txt" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2A9F95AB-65A3-432c-8631-B8BC5BF7477A}" /v "UninstallString" /t REG_SZ /d "%game_lpath%\\local\\EAUninstall.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{2A9F95AB-65A3-432c-8631-B8BC5BF7477A}" /v "SystemComponent" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{B931FB80-537A-4600-00AD-AC5DEDB6C25B}" /v "DisplayIcon" /t REG_SZ /d "%game_lpath%\\local\\EP1\\LotRIcon.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{B931FB80-537A-4600-00AD-AC5DEDB6C25B}" /v "DisplayName" /t REG_SZ /d "Rise of the Witch-king" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{B931FB80-537A-4600-00AD-AC5DEDB6C25B}" /v "FriendlyName" /t REG_SZ /d "The Lord of the Rings, The Rise of the Witch-king" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{B931FB80-537A-4600-00AD-AC5DEDB6C25B}" /v "LogFile" /t REG_SZ /d "%game_lpath%\\local\\EP1\\filelist.txt" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{B931FB80-537A-4600-00AD-AC5DEDB6C25B}" /v "UninstallString" /t REG_SZ /d "%game_lpath%\\local\\EP1\\EAUninstall.exe" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\{B931FB80-537A-4600-00AD-AC5DEDB6C25B}" /v "SystemComponent" /t REG_DWORD /d "1" /f

cd local
"keygen.exe"