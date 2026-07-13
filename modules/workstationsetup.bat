@echo off
title Basic Workstation Setup
color 0A

echo =====================================
echo BASIC WORKSTATION SETUP
echo =====================================
echo.

echo Computer Name:
hostname
echo.

echo Windows Information:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
echo.

echo Flushing DNS Cache...
ipconfig /flushdns
echo.

echo Creating Support Folder...
mkdir C:\Support 2>nul
echo.

echo Opening Windows Update...
start ms-settings:windowsupdate
echo.

echo Setup Completed Successfully!

pause
exit /b