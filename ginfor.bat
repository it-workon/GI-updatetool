@echo off
echo Starting GI update...
echo.

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0UpdateGI.ps1"

echo.
echo Script finished.
pause