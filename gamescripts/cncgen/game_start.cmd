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
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Generals" /v "Language" /t REG_SZ /d "german" /f
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "Language" /t REG_SZ /d "german" /f
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "UserDataLeafName" /t REG_SZ /d "Command and Conquer Generals Zero Hour Data" /f
	copy /y "patchget.dat_de" patchget.dat"
	copy /y "ZeroHour\patchget.dat_de" "ZeroHour\patchget.dat"
	copy /y "ZeroHour\langdata.dat_de" "ZeroHour\langdata.dat"
)

if %game_lang% == en (
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Generals" /v "Language" /t REG_SZ /d "english" /f
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "Language" /t REG_SZ /d "english" /f
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "UserDataLeafName" /t REG_SZ /d "Command and Conquer Generals Zero Hour Data" /f
	copy /y "patchget.dat_en" "patchget.dat"
	copy /y "ZeroHour\patchget.dat_en" "ZeroHour\patchget.dat"
	copy /y "ZeroHour\langdata.dat_en" "ZeroHour\langdata.dat"
)

if %game_lang% == fr (
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Generals" /v "Language" /t REG_SZ /d "english" /f
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "Language" /t REG_SZ /d "english" /f
	reg.exe add "HKLM\SOFTWARE\Wow6432Node\Electronic Arts\EA GAMES\Command and Conquer Generals Zero Hour" /v "UserDataLeafName" /t REG_SZ /d "Command and Conquer Generals Zero Hour Data" /f
	copy /y "patchget.dat_en" "patchget.dat"
	copy /y "ZeroHour\patchget.dat_en" "ZeroHour\patchget.dat"
	copy /y "ZeroHour\langdata.dat_en" "ZeroHour\langdata.dat"	
)


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\ZeroHour\generals.exe" profile=any enable=yes >nul

cd "ZeroHour"
cls
"generals.exe"


:end
netsh advfirewall firewall delete rule name="%game_id%" >nul
exit
