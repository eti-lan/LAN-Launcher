set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

chcp 65001 
echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local
cd EP1

if %game_lang% == de (
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Locale" /t REG_SZ /d "de" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "Language" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "LanguageName" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Language" /t REG_SZ /d "German" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Locale" /t REG_SZ /d "de" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "Language" /t REG_DWORD /d "3" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "LanguageName" /t REG_SZ /d "German" /f
)

if %game_lang% == en (
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "Language" /t REG_SZ /d "English" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Language" /t REG_SZ /d "English" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Language" /t REG_SZ /d "English" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Locale" /t REG_SZ /d "en" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "Language" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "LanguageName" /t REG_SZ /d "English" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Language" /t REG_SZ /d "English" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Locale" /t REG_SZ /d "en" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "Language" /t REG_DWORD /d "1" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "LanguageName" /t REG_SZ /d "English" /f
)

if %game_lang% == fr (
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Battle for Middle-earth II" /v "Language" /t REG_SZ /d "French" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Language" /t REG_SZ /d "French" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Language" /t REG_SZ /d "French" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II" /v "Locale" /t REG_SZ /d "fr" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "Language" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Battle for Middle-earth II\1.0" /v "LanguageName" /t REG_SZ /d "French" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Language" /t REG_SZ /d "French" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king" /v "Locale" /t REG_SZ /d "fr" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "Language" /t REG_DWORD /d "2" /f
reg.exe add "HKLM\SOFTWARE\WOW6432Node\Electronic Arts\The Lord of the Rings, The Rise of the Witch-king\1.0" /v "LanguageName" /t REG_SZ /d "French" /f
)

cls
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\EP1\lotrbfme2ep1.exe" profile=any enable=yes >nul

"lotrbfme2ep1.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul

exit