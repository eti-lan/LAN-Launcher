echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2" /v "DisplayName" /t REG_SZ /d "Battlefield: Bad Company™ 2" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2" /v "ProductName" /t REG_SZ /d "Battlefield: Bad Company™ 2" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2" /v "Locale" /t REG_SZ /d "de" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2" /v "Patch URL" /t REG_SZ /d "http://battlefieldbadcompany2.com" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2" /v "Product GUID" /t REG_SZ /d "{3AC8457C-0385-4BEA-A959-E095F05D6D67}" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2" /v "Suppression Exe" /t REG_SZ /d "" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2\1.0" /v "DisplayName" /t REG_SZ /d "Battlefield Bad Company 2" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2\1.0" /v "Language" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\electronic arts\Battlefield Bad Company 2\1.0" /v "LanguageName" /t REG_SZ /d "German" /f

