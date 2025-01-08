echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKLM\SOFTWARE\WOW6432Node\Activision\Call of Duty United Offensive" /v "key" /t REG_SZ /d "N7Z77N7KXWRHNDZ37017" /f
reg.exe add "HKLM\SOFTWARE\Activision\Call of Duty United Offensive" /v "key" /t REG_SZ /d "N7Z77N7KXWRHNDZ37017" /f
