echo off
cls
setlocal EnableDelayedExpansion
cd /d "%~dp0"
cd local

cd "garrysmod\addons"

for %%f in (*.gma) do (
  echo "Addon: %%f"
  "..\..\bin\gmad.exe" extract -file ..\..\garrysmod\addons\%%f -out ..\..\garrysmod
)
