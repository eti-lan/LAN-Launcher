echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg add "HKLM\SOFTWARE\Wow6432Node\Unreal Technology\Installed Apps\UT2004" /v "CDKey" /t REG_SZ /d "DEV2K-DEV46-DEV78-TJ74H" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Unreal Technology\Installed Apps\UT2004" /v "TITLEBAR" /t REG_SZ /d "Unreal Tournament 2004" /f
reg add "HKLM\SOFTWARE\Wow6432Node\Unreal Technology\Installed Apps\UT2004" /v "YEAR" /t REG_SZ /d "2004" /f
reg add "HKLM\SOFTWARE\Unreal Technology\Installed Apps\UT2004" /v "Version" /t REG_SZ /d "3236" /f
reg add "HKLM\SOFTWARE\Unreal Technology\Installed Apps\UT2004" /v "CDKey" /t REG_SZ /d "DEV2K-DEV46-DEV78-TJ74H" /f
reg add "HKLM\SOFTWARE\Unreal Technology\Installed Apps\UT2004" /v "TITLEBAR" /t REG_SZ /d "Unreal Tournament 2004" /f
reg add "HKLM\SOFTWARE\Unreal Technology\Installed Apps\UT2004" /v "YEAR" /t REG_SZ /d "2004" /f
