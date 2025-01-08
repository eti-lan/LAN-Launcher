echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"

set cohpath="%userprofile%\Documents\My Games\Company of Heroes\"
"%programfiles%\eti\lan launcher\unrar.exe" x -o -y "coh_maps_8p.eti" %cohpath%
"%programfiles%\eti\lan launcher\unrar.exe" x -o -y "coh_profile.eti" %cohpath%
