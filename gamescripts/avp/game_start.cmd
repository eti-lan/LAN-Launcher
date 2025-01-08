set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

del /S Envs\*.en
del /S Envs\*.ge
del /S Envs\*.fr
del /S Misc\*.en
del /S Misc\*.ge
del /S Misc\*.fr
del /S Misc\*En.asr
del /S Misc\*Fr.asr
del /S Misc\*Ge.asr

if %game_lang% == de (
	copy /y "lang\de\Envs\Colony\*.*" Envs\Colony\
	copy /y "lang\de\Envs\Jungle\*.*" Envs\Jungle\
	copy /y "lang\de\Envs\Lab\*.*" Envs\Lab\
	copy /y "lang\de\Envs\MP\*.*" Envs\MP\
	copy /y "lang\de\Envs\P00_Tutorial\*.*" Envs\P00_Tutorial\
	copy /y "lang\de\Envs\Pyramid\*.*" Envs\Pyramid\
	copy /y "lang\de\Envs\Refinery\*.*" Envs\Refinery\
	copy /y "lang\de\Envs\Ruins\*.*" Envs\Ruins\
	copy /y "lang\de\Misc\*.ge" Misc\
	copy /y "lang\de\Misc\Credits\*.*" Misc\Credits\
	copy /y "lang\de\Misc\Cutscene\*.*" Misc\Cutscene\
	copy /y "lang\de\Misc\Menu\*.*" Misc\Menu\
)

if %game_lang% == en (
	copy /y "lang\en\Envs\Colony\*.*" Envs\Colony\
	copy /y "lang\en\Envs\Jungle\*.*" Envs\Jungle\
	copy /y "lang\en\Envs\Lab\*.*" Envs\Lab\
	copy /y "lang\en\Envs\MP\*.*" Envs\MP\
	copy /y "lang\en\Envs\P00_Tutorial\*.*" Envs\P00_Tutorial\
	copy /y "lang\en\Envs\Pyramid\*.*" Envs\Pyramid\
	copy /y "lang\en\Envs\Refinery\*.*" Envs\Refinery\
	copy /y "lang\en\Envs\Ruins\*.*" Envs\Ruins\
	copy /y "lang\en\Misc\*.ge" Misc\
	copy /y "lang\en\Misc\Credits\*.*" Misc\Credits\
	copy /y "lang\en\Misc\Cutscene\*.*" Misc\Cutscene\
	copy /y "lang\en\Misc\Menu\*.*" Misc\Menu\
)

if %game_lang% == fr (
	copy /y "lang\fr\Envs\Colony\*.*" Envs\Colony\
	copy /y "lang\fr\Envs\Jungle\*.*" Envs\Jungle\
	copy /y "lang\fr\Envs\Lab\*.*" Envs\Lab\
	copy /y "lang\fr\Envs\MP\*.*" Envs\MP\
	copy /y "lang\fr\Envs\P00_Tutorial\*.*" Envs\P00_Tutorial\
	copy /y "lang\fr\Envs\Pyramid\*.*" Envs\Pyramid\
	copy /y "lang\fr\Envs\Refinery\*.*" Envs\Refinery\
	copy /y "lang\fr\Envs\Ruins\*.*" Envs\Ruins\
	copy /y "lang\fr\Misc\*.ge" Misc\
	copy /y "lang\fr\Misc\Credits\*.*" Misc\Credits\
	copy /y "lang\fr\Misc\Cutscene\*.*" Misc\Cutscene\
	copy /y "lang\fr\Misc\Menu\*.*" Misc\Menu\
)


netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\AvP_DX11.exe" profile=any enable=yes >nul
netsh advfirewall firewall add rule name="%game_id%" dir=in action=allow program="%game_path%\local\AvP.exe" profile=any enable=yes >nul

"AvP_DX11.exe"

netsh advfirewall firewall delete rule name="%game_id%" >nul
exit