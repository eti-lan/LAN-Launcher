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
	cd "DE"
	"Empires_DMW.exe"
)

if %game_lang% == en (
	cd "EN"
	"Empires_DMW.exe"
)

if %game_lang% == fr (
	cd "FR"
	"Empires_DMW.exe"
)

exit