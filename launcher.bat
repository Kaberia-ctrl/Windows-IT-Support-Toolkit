@echo off
:MENU
cls
title Windows IT Support Toolkit

echo =====================================
echo WINDOWS IT SUPPORT TOOLKIT
echo =====================================
echo.
echo 1. Workstation Setup
echo 2. Exit
echo.

set /p choice=Select Option:

if "%choice%"=="1" call modules\workstationsetup.bat
if "%choice%"=="2" exit

echo Invalid Option.
pause
goto MENU