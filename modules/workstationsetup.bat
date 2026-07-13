@echo off
title Basic Workstation Setup
color 0A

:: Create timestamp
set DATESTAMP=%date:~-4%-%date:~4,2%-%date:~7,2%
set TIMESTAMP=%time:~0,2%-%time:~3,2%
set TIMESTAMP=%TIMESTAMP: =0%

:: Log file location
set LOGFILE=C:\Support\Workstation_Setup_%DATESTAMP%_%TIMESTAMP%.txt

echo =====================================
echo BASIC WORKSTATION SETUP
echo =====================================
echo.

:: Create Support folder
mkdir C:\Support 2>nul

echo ===================================== > "%LOGFILE%"
echo BASIC WORKSTATION SETUP REPORT >> "%LOGFILE%"
echo ===================================== >> "%LOGFILE%"
echo Date: %date% >> "%LOGFILE%"
echo Time: %time% >> "%LOGFILE%"
echo. >> "%LOGFILE%"

:: Logged-in User
echo Logged-in User:
whoami
echo.

echo Logged-in User >> "%LOGFILE%"
whoami >> "%LOGFILE%"
echo. >> "%LOGFILE%"

:: Computer Name
echo Computer Name:
hostname
echo.

echo Computer Name >> "%LOGFILE%"
hostname >> "%LOGFILE%"
echo. >> "%LOGFILE%"

:: Windows Version
echo Windows Information:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
echo.

echo Windows Information >> "%LOGFILE%"
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" >> "%LOGFILE%"
echo. >> "%LOGFILE%"

:: IP Address
echo Network Information:
ipconfig | findstr /C:"IPv4"
echo.

echo Network Information >> "%LOGFILE%"
ipconfig | findstr /C:"IPv4" >> "%LOGFILE%"
echo. >> "%LOGFILE%"

:: Flush DNS
echo Flushing DNS Cache...
ipconfig /flushdns
echo DNS Cache Flushed >> "%LOGFILE%"
echo. >> "%LOGFILE%"

:: Disk Space
echo Disk Information:
wmic logicaldisk get caption,freespace,size
echo.

echo Disk Information >> "%LOGFILE%"
wmic logicaldisk get caption,freespace,size >> "%LOGFILE%"
echo. >> "%LOGFILE%"

:: Check Winget
echo Checking for Winget...
where winget >nul 2>&1

if %errorlevel%==0 (
    echo Winget Installed
    winget --version

    echo Winget Installed >> "%LOGFILE%"
    winget --version >> "%LOGFILE%"
) else (
    echo Winget NOT Installed
    echo Install App Installer from Microsoft Store.

    echo Winget NOT Installed >> "%LOGFILE%"
)
echo. >> "%LOGFILE%"

:: Open Windows Update
echo Opening Windows Update...
start ms-settings:windowsupdate

echo Windows Update Opened >> "%LOGFILE%"

echo.
echo Setup Completed Successfully!
echo.
echo Report Saved To:
echo %LOGFILE%

pause
exit