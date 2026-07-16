@echo off
:MAIN
cls
echo =====================================
echo WINDOWS IT SUPPORT TOOLKIT
echo =====================================
echo [P] Poweshell Tools
echo [B] Batch Tools
echo [L] Open Logs Folder
echo [Q] Quit
echo =====================================
set /p choice=Select an option:

if /i "%choice%"=="P" goto POWERSHELL
if /i "%choice%"=="B" goto BATCH
if /i "%choice%"=="L" goto "%~dp0logs%"
if /i "%choice%"=="Q" goto QUIT
goto MAIN

:POWERSHELL
powershell -ExecutionPolicy Bypass -File "%~dp0launcher.ps1"
goto MAIN

:BATCH
cls
echo ====Batch Toolkit====
echo 1. PC Setup
echo 2. Maintenance
echo 3. Diagnostics
echo 4. Networking
echo 5. Security
echo 6. Exit
echo.

set /p choice=Select an option:

if "%choice%"=="1" call batch\setup.bat
if "%choice%"=="2" call batch\maintenance.bat
if "%choice%"=="3" call batch\diag.bat
if "%choice%"=="4" call batch\test.bat
if "%choice%"=="5" call batch\sec.bat
if "%choice%"=="6" exit

echo Invalid option.
pause
goto BATCH