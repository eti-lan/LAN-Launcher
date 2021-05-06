set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4
set modstart=0

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

copy /y "RA3_english_1.12.default.SkuDef" "RA3_english_1.12.SkuDef" >nul

echo ................................
echo Command ^& Conquer - Red Alert 3
echo   with Generals Evolution Mod
echo ................................
echo.
echo 1 - Red Alert 3
echo 2 - Generals Evolution
echo.
echo.
set /p s=Select game:
if %s% == 1 goto lang
if %s% == 2 goto genevomod

:genevomod
set game_lang=en
set modstart=1


:lang

if %game_lang% == de (
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Locale" /t REG_SZ /d "de_DE" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.12" /v "LanguageName" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.0" /v "LanguageName" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKCU\SOFTWARE\Electronic Arts\Electronic Arts\Red Alert 3" /v "Language" /t REG_SZ /d "german" /f
)

if %game_lang% == en (
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Locale" /t REG_SZ /d "en_US" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.12" /v "LanguageName" /t REG_SZ /d "English (US)" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.0" /v "LanguageName" /t REG_SZ /d "English (US)" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Language" /t REG_SZ /d "English (US)" /f
reg.exe add "HKCU\SOFTWARE\Electronic Arts\Electronic Arts\Red Alert 3" /v "Language" /t REG_SZ /d "english" /f
)

if %game_lang% == fr (
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Locale" /t REG_SZ /d "fr_FR" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.12" /v "LanguageName" /t REG_SZ /d "French" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3\1.0" /v "LanguageName" /t REG_SZ /d "French" /f
reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\Electronic Arts\Red Alert 3" /v "Language" /t REG_SZ /d "French" /f
reg.exe add "HKCU\SOFTWARE\Electronic Arts\Electronic Arts\Red Alert 3" /v "Language" /t REG_SZ /d "french" /f
)

cls
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\data\ra3_1.12.game" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\RA3.exe" profile=any enable=yes >nul


if %modstart%==1 (
echo.
echo Loading, relax...
"RA3.exe" -modconfig "%game_path%\local\GenEvo\GenEvo_B0.2.skudef"
) else (
echo.
echo Loading, relax...
"RA3.exe"
)

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit