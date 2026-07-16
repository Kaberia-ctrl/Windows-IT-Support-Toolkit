@echo off
title Batch Toolkit
color 0A

cd /d "%~dp0.."

:: Create folders if they do not exist
if not exist logs mkdir logs
if not exist reports mkdir reports

set REPORT=reports\SystemInfo.txt
set LOG=logs\system-info.log

echo =============================================== > "%REPORT%"
echo          WINDOWS SYSTEM INFORMATION >> "%REPORT%"
echo =============================================== >> "%REPORT%"
echo Date: %date% >> "%REPORT%"
echo Time: %time% >> "%REPORT%"
echo. >> "%REPORT%"

echo Gathering system information...
echo [%date% %time%] System Information Started >> "%LOG%"

echo ==============================
echo Logged-in User
echo ==============================
whoami
echo.
echo ### Logged-in User ### >> "%REPORT%"
whoami >> "%REPORT%"
echo. >> "%REPORT%"

echo ==============================
echo Computer Name
echo ==============================
hostname
echo.
echo ### Computer Name ### >> "%REPORT%"
hostname >> "%REPORT%"
echo. >> "%REPORT%"

echo ==============================
echo Windows Version
echo ==============================
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
echo.
echo ### Windows Version ### >> "%REPORT%"
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" >> "%REPORT%"
echo. >> "%REPORT%"

echo ==============================
echo Processor
echo ==============================
wmic cpu get Name
echo.
echo ### Processor ### >> "%REPORT%"
wmic cpu get Name >> "%REPORT%"
echo. >> "%REPORT%"

echo ==============================
echo Installed RAM
echo ==============================
wmic computersystem get TotalPhysicalMemory
echo.
echo ### Installed RAM ### >> "%REPORT%"
wmic computersystem get TotalPhysicalMemory >> "%REPORT%"
echo. >> "%REPORT%"

echo ==============================
echo Disk Information
echo ==============================
wmic logicaldisk get DeviceID,FreeSpace,Size
echo.
echo ### Disk Information ### >> "%REPORT%"
wmic logicaldisk get DeviceID,FreeSpace,Size >> "%REPORT%"
echo. >> "%REPORT%"

echo ==============================
echo IP Configuration
echo ==============================
ipconfig
echo.
echo ### IP Configuration ### >> "%REPORT%"
ipconfig >> "%REPORT%"
echo. >> "%REPORT%"

echo ==============================
echo Network Adapters
echo ==============================
netsh interface show interface
echo.
echo ### Network Adapters ### >> "%REPORT%"
netsh interface show interface >> "%REPORT%"
echo. >> "%REPORT%"

echo ==============================
echo Running Processes
echo ==============================
tasklist
echo.
echo ### Running Processes ### >> "%REPORT%"
tasklist >> "%REPORT%"

echo.
echo Report saved to:
echo %REPORT%

echo [%date% %time%] Report Generated >> "%LOG%"

pause