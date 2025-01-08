set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local


if %game_lang% == de (
        "fnr.exe" --cl --silent --dir "%appdata%\Ubisoft\Anno1404\Config" --fileMask "Engine.ini" --useRegEx --useEscapeChars --find "<LanguageTAG>.*</LanguageTag>" --replace "<LanguageTAG>ger</LanguageTag>"
        "fnr.exe" --cl --silent --dir "%appdata%\Ubisoft\Anno1404Addon\Config" --fileMask "Engine.ini" --useRegEx --useEscapeChars --find "<LanguageTAG>.*</LanguageTag>" --replace "<LanguageTAG>ger</LanguageTag>"
)

if %game_lang% == en (
        "fnr.exe" --cl --silent --dir "%appdata%\Ubisoft\Anno1404\Config" --fileMask "Engine.ini" --useRegEx --useEscapeChars --find "<LanguageTAG>.*</LanguageTag>" --replace "<LanguageTAG>eng</LanguageTag>"
        "fnr.exe" --cl --silent --dir "%appdata%\Ubisoft\Anno1404Addon\Config" --fileMask "Engine.ini" --useRegEx --useEscapeChars --find "<LanguageTAG>.*</LanguageTag>" --replace "<LanguageTAG>eng</LanguageTag>"
)

if %game_lang% == fr (
        "fnr.exe" --cl --silent --dir "%appdata%\Ubisoft\Anno1404\Config" --fileMask "Engine.ini" --useRegEx --useEscapeChars --find "<LanguageTAG>.*</LanguageTag>" --replace "<LanguageTAG>fra</LanguageTag>"
        "fnr.exe" --cl --silent --dir "%appdata%\Ubisoft\Anno1404Addon\Config" --fileMask "Engine.ini" --useRegEx --useEscapeChars --find "<LanguageTAG>.*</LanguageTag>" --replace "<LanguageTAG>fra</LanguageTag>"
)


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Anno1404.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\Anno1404Addon.exe" profile=any enable=yes >nul


:addon 
"Anno1404Addon.exe"
goto:end


:end 
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit

