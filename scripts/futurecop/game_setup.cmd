echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "CD Drive" /t REG_SZ /d "G:\\" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "DisplayName" /t REG_SZ /d "Future Cop" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "Language" /t REG_SZ /d "english" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "Missions" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "Movies" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "3D Device Description" /t REG_SZ /d "3Dfx Voodoo" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "3D Card" /t REG_SZ /d "3Dfx Voodoo" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "Thrash Driver" /t REG_SZ /d "voodoo" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "Group" /t REG_SZ /d "3Dfx" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "D3D Device" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "Triple Buffer" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop" /v "Hardware Acceleration" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\1.0" /v "DisplayName" /t REG_SZ /d "Future Cop" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\1.0" /v "Language" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "ProcessorType" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "FailRecovery" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "SfxVolume" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "MusicVolume" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "MovieVolume" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "ColoringIsOff" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "Resolution" /t REG_DWORD /d "4" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "FullScreen" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "ShowDebugText" /t REG_DWORD /d "0" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Future Cop\Settings" /v "SoftwareRendering" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0\local\FCopLAPD.exe" /d "WIN98 16BITCOLOR" /f
reg.exe add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%~dp0\local\FCopLAPD.exe" /d "WIN98 16BITCOLOR" /f