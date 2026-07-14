@echo off
:MENU
cls
echo =====================================
echo WINDOWS IT SUPPORT TOOLKIT
echo =====================================
echo.
echo 1. Workstation Setup
echo 2. Maintenance
echo 3. Diagnostics
echo 4. Networking
echo 5. Security
echo 6. Exit
echo.

set /p choice=Select an option:

if "%choice%"=="1" call modules\workstationsetup.bat
if "%choice%"=="2" call modules\maintenance.bat
if "%choice%"=="3" call modules\diagnostics.bat
if "%choice%"=="4" call modules\networking.bat
if "%choice%"=="5" call modules\security.bat
if "%choice%"=="6" exit

echo Invalid option.
pause
goto MENU