@echo off
cd /d "%~dp0"
cd local
SET locpath=%~dp0
SET locpath=%locpath:~0,-1%

@echo off
IF NOT DEFINED PROCESSOR_ARCHITEW6432 (	
	%SYSTEMROOT%\system32\DISM.EXE /Online /enable-feature /FeatureName:"DirectPlay" /all /NoRestart
) ELSE (		
	%SYSTEMROOT%\sysNative\DISM.EXE /Online /enable-feature /FeatureName:"DirectPlay" /all /NoRestart
)

regedit /s "directplay-win64.reg"

SET regpath="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectPlay\Service Providers\IPX Connection For DirectPlay"
::echo %locpath%
reg add %regpath% /v "dwReserved1" /t REG_DWORD /d 50 /f /reg:32
reg add %regpath% /v "dwReserved2" /t REG_DWORD /d 0 /f /reg:32
reg add %regpath% /v "Guid" /t REG_SZ /d "{685BC400-9D2C-11cf-A9CD-00AA006886E3}" /f /reg:32
reg add %regpath% /v "Path" /t REG_SZ /d "dpwsockx.dll" /f /reg:32
reg add %regpath% /v "DescriptionA" /t REG_SZ /d "IPX Connection For DirectPlay" /f /reg:32
reg add %regpath% /v "DescriptionW" /t REG_SZ /d "IPX Connection For DirectPlay" /f /reg:32

SET regpath="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectPlay\Services\{5146ab8cb6b1ce11920c00aa006c4972}"
reg add %regpath% /v "Description" /t REG_SZ /d "WinSock IPX Connection For DirectPlay" /f /reg:32
reg add %regpath% /v "Path" /t REG_EXPAND_SZ /d dpwsockx.dll /f /reg:32
