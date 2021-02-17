echo off
cls
setlocal enabledelayedexpansion
cd /d "%~dp0"
cd local


:: -----------------------------------------------------------
set gameport=28960
set serverfilename=serverlan.cfg
set modfoldername=
set partyenable=
set sconfig=
:: -----------------------------------------------------------



color 20

:servercfg_fix
if exist "userraw\serverlan.cfg" (
    echo.
	echo Server CFG - OK
	echo.
) else (
    copy "..\serverlan.cfg" "userraw\"
	cls
)


:: -----------------------------------------------------------
echo Enable bots? (y/n)
set /p bots=
if %bots% == y set modfoldername=mods/bots
:: -----------------------------------------------------------

echo.
:: -----------------------------------------------------------
echo Enable "IWnet style" lobby mode? (y/n)
set /p lobby=
if %lobby% == y set partyenable=1
:: -----------------------------------------------------------

echo.
:: -----------------------------------------------------------
echo Do you want to select a mod? This will disable bots! (y/n)
set /p selectmod=
if %selectmod% == y goto smod
goto sconfig
:: -----------------------------------------------------------


:: -----------------------------------------------------------
:smod
set index=1

setlocal EnableDelayedExpansion
for /f %%f in ('dir /b /ad "mods"') do (
	set file!index!=%%f
	echo !index! - %%f
	set /A index=!index!+1
)

setlocal DisableDelayedExpansion

echo.
set /p selection="Select mod by number:"

set file%selection% >nul 2>&1

if errorlevel 1 (
	echo invalid number selected
	exit /b 1
)

call :resolve %%file%selection%%%
echo selected mod: %mod_name%

:resolve
set mod_name=%1
set modfoldername=mods/%mod_name%
:: -----------------------------------------------------------


:: -----------------------------------------------------------
:sconfig
echo.
echo Do you want to edit the server config file? (y/n)
set /p sconfig=
if %sconfig% == y goto editscfg
:: -----------------------------------------------------------


:start

"iw4x.exe" -dedicated +set fs_game "%modfoldername%" +set sv_lanonly "1" +set net_port "%gameport%" +exec %serverfilename% +set party_enable "%partyenable%" +map_rotate


:end
del /f /q "updater.exe">nul
exit


:editscfg
notepad "userraw\serverlan.cfg"
echo.
echo Waiting for the editor to be closed.
goto start
