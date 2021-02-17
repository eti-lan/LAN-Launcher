echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

pushd "%userprofile%\Documents"
rmdir /s /q "Battlefield 2142\Profiles"

popd