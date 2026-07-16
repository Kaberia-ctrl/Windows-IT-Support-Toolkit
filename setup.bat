@echo off
title Workstation Setup
color 0A
setlocal EnableDelayedExpansion

:: ============================================================
:: Workstation Setup
:: Version: 2.0
:: ============================================================

:: Check Administrator
net session >nul 2>&1
if %errorlevel% neq 0 (
    color 0C
    echo.
    echo ***********************************************
    echo   ERROR: Run this script as Administrator.
    echo ***********************************************
    pause
    exit
)

:: Create Report Folder
set REPORTDIR=C:\ITReports

if not exist "%REPORTDIR%" mkdir "%REPORTDIR%"

set LOG=%REPORTDIR%\SetupLog.txt
set REPORT=%REPORTDIR%\SystemInfo.txt

echo =============================================== > "%LOG%"
echo Enterprise Workstation Setup >> "%LOG%"
echo Started: %DATE% %TIME% >> "%LOG%"
echo =============================================== >> "%LOG%"

cls
echo =====================================================
echo           ENTERPRISE WORKSTATION SETUP
echo =====================================================
echo.

:: ============================================================
:: Computer Information
:: ============================================================

echo Gathering System Information...

(
echo =====================================================
echo SYSTEM INFORMATION
echo =====================================================
echo.
echo Computer Name : %COMPUTERNAME%
echo User          : %USERNAME%
echo Date          : %DATE%
echo Time          : %TIME%
echo.

hostname

echo.
systeminfo

echo.
ipconfig /all

echo.
wmic cpu get Name

echo.
wmic memorychip get Capacity

echo.
wmic diskdrive get Model,Size

) > "%REPORT%"

echo Done.
echo.

:: ============================================================
:: Internet Test
:: ============================================================

echo Checking Internet...

ping -n 2 8.8.8.8 >nul

if errorlevel 1 (
    echo No Internet Connection
    echo Internet : FAILED >> "%LOG%"
) else (
    echo Internet Connected
    echo Internet : OK >> "%LOG%"
)

echo.

:: ============================================================
:: Winget
:: ============================================================

where winget >nul 2>&1

if errorlevel 1 (

    echo Winget not installed.
    echo Please install Microsoft App Installer.
    echo Winget : Missing >> "%LOG%"

) else (

    echo Winget Found
    winget source update
    echo Winget : OK >> "%LOG%"
)

echo.

:: ============================================================
:: Install Software
:: ============================================================

where winget >nul 2>&1

if not errorlevel 1 (

echo Installing Google Chrome...
winget install --id Google.Chrome --silent --accept-package-agreements --accept-source-agreements

echo Installing Mozilla Firefox...
winget install --id Mozilla.Firefox --silent --accept-package-agreements --accept-source-agreements

echo Installing Adobe Acrobat Reader...
winget install --id Adobe.Acrobat.Reader.64-bit --silent --accept-package-agreements --accept-source-agreements

echo Installing 7-Zip...
winget install --id 7zip.7zip --silent --accept-package-agreements --accept-source-agreements

echo Installing VLC...
winget install --id VideoLAN.VLC --silent --accept-package-agreements --accept-source-agreements

echo Installing Notepad++...
winget install --id Notepad++.Notepad++ --silent --accept-package-agreements --accept-source-agreements

echo Installing Visual Studio Code...
winget install --id Microsoft.VisualStudioCode --silent --accept-package-agreements --accept-source-agreements

echo Installing Git...
winget install --id Git.Git --silent --accept-package-agreements --accept-source-agreements

echo Installing PowerToys...
winget install --id Microsoft.PowerToys --silent --accept-package-agreements --accept-source-agreements

echo Installing AnyDesk...
winget install --id AnyDeskSoftwareGmbH.AnyDesk --silent --accept-package-agreements --accept-source-agreements

)

echo.
echo Software Installation Complete.
echo.

:: ============================================================
:: Windows Activation
:: ============================================================

echo Checking Windows Activation...
cscript //nologo %windir%\system32\slmgr.vbs /xpr

echo.

:: ============================================================
:: Windows Update Scan
:: ============================================================

echo Starting Windows Update Scan...
UsoClient StartScan

echo.

:: ============================================================
:: Flush DNS
:: ============================================================

echo Flushing DNS Cache...
ipconfig /flushdns

echo.

:: ============================================================
:: Clean Temp Files
:: ============================================================

echo Cleaning Temporary Files...

del /s /q "%TEMP%\*" >nul 2>&1
del /s /q "C:\Windows\Temp\*" >nul 2>&1

echo Done.
echo.

:: ============================================================
:: Network Information
:: ============================================================

echo Saving Network Information...

(
echo.
echo =====================================================
echo NETWORK INFORMATION
echo =====================================================
echo.

netsh wlan show interfaces

echo.

arp -a

echo.

route print

) >> "%REPORT%"

:: ============================================================
:: Installed Software List
:: ============================================================

echo Saving Installed Programs...

(
echo.
echo =====================================================
echo INSTALLED SOFTWARE
echo =====================================================
wmic product get Name,Version
) >> "%REPORT%"

:: ============================================================
:: Disk Information
:: ============================================================

(
echo.
echo =====================================================
echo DISK INFORMATION
echo =====================================================
wmic logicaldisk get Caption,FileSystem,FreeSpace,Size
) >> "%REPORT%"

:: ============================================================
:: Completion
:: ============================================================

echo.>>"%LOG%"
echo Completed Successfully >> "%LOG%"
echo End Time: %DATE% %TIME% >> "%LOG%"

cls

echo =====================================================
echo            WORKSTATION SETUP COMPLETE
echo =====================================================
echo.
echo Setup completed successfully.
echo.
echo Reports saved to:
echo     %REPORTDIR%
echo.
echo Log File:
echo     %LOG%
echo.
echo System Report:
echo     %REPORT%
echo.

pause