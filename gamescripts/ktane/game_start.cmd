set game_path=%1
set game_id=%2
set game_lang=%3
set player=%4

echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

if %game_lang% == de (
	set lang=german
)

if %game_lang% == en (
	set lang=english
)

if %game_lang% == fr (
	set lang=french
)

:kante 
cd "local\"
"PDFXCview.exe" "%lang%.pdf"
"ktane.exe"

exit
