#==========================================================
# Workstation Script
# Version 1.0
# Author: Victor Kamau
#==========================================================

Clear-Host
$Host.UI.RawUI.WindowTitle = "Windows-IT-Support"

# Console Colors
function Write-Title {
    param($Text)
    Write-Host ""
    Write-Host "==================================================" -ForegroundColor Cyan
    Write-Host $Text -ForegroundColor Yellow
    Write-Host "==================================================" -ForegroundColor Cyan
}

function Write-Success {
    param($Text)
    Write-Host "[SUCCESS] $Text" -ForegroundColor Green
}

function Write-WarningMsg {
    param($Text)
    Write-Host "[WARNING] $Text" -ForegroundColor Yellow
}

function Write-ErrorMsg {
    param($Text)
    Write-Host "[ERROR] $Text" -ForegroundColor Red
}

#----------------------------------------------------------
# Check Administrator
#----------------------------------------------------------

if (-NOT ([Security.Principal.WindowsPrincipal]
[Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole(
[Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Write-Host ""
    Write-Host "Please run this script as Administrator." -ForegroundColor Red
    Pause
    exit
}

#----------------------------------------------------------
# Create Log Folder
#----------------------------------------------------------

$LogFolder = "C:\psreports"

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = "$LogFolder\Setup_$(Get-Date -Format yyyyMMdd_HHmmss).log"

Start-Transcript -Path $LogFile

Write-Title "POWERSHELL SETUP"

#----------------------------------------------------------
# System Information
#----------------------------------------------------------

Write-Title "SYSTEM INFORMATION"

$Computer = Get-ComputerInfo

Write-Host "Computer Name : $env:COMPUTERNAME"
Write-Host "Logged User   : $env:USERNAME"
Write-Host "Manufacturer  : $($Computer.CsManufacturer)"
Write-Host "Model         : $($Computer.CsModel)"
Write-Host "Windows       : $($Computer.WindowsProductName)"
Write-Host "Version       : $($Computer.WindowsVersion)"
Write-Host "Build         : $($Computer.OsBuildNumber)"
Write-Host "RAM           : $([Math]::Round($Computer.TotalPhysicalMemory/1GB,2)) GB"

#----------------------------------------------------------
# Check Internet
#----------------------------------------------------------

Write-Title "CHECKING INTERNET CONNECTION"

if(Test-Connection google.com -Count 2 -Quiet)
{
    Write-Success "Internet Connection Available"
}
else
{
    Write-ErrorMsg "No Internet Connection"
}

#----------------------------------------------------------
# Install Winget
#----------------------------------------------------------

Write-Title "CHECKING WINGET"

if(Get-Command winget -ErrorAction SilentlyContinue)
{
    Write-Success "Winget Installed"
}
else
{
    Write-WarningMsg "Winget Not Found"

    Add-AppxPackage `
https://aka.ms/getwinget

    Start-Sleep 10
}

#----------------------------------------------------------
# Update Winget Sources
#----------------------------------------------------------

Write-Title "UPDATING WINGET"

winget source update

#----------------------------------------------------------
# Install Common Applications
#----------------------------------------------------------

Write-Title "INSTALLING APPLICATIONS"

$Apps = @(

"Mozilla.Firefox"

"Adobe.Acrobat.Reader.64-bit"

"Microsoft.PowerToys"

"AnyDeskSoftwareGmbH.AnyDesk"

)

foreach($App in $Apps)
{
    Write-Host ""
    Write-Host "Installing $App..."

    winget install --id $App `
    --accept-package-agreements `
    --accept-source-agreements `
    --silent
}

Write-Success "Application Installation Complete"

#----------------------------------------------------------
# Create Restore Point
#----------------------------------------------------------

Write-Title "CREATING RESTORE POINT"

Enable-ComputerRestore -Drive "C:\"

Checkpoint-Computer `
-Description "Initial Workstation Setup" `
-RestorePointType MODIFY_SETTINGS

Write-Success "Restore Point Created"

#----------------------------------------------------------
# Windows Activation
#----------------------------------------------------------

Write-Title "WINDOWS ACTIVATION"

cscript "$env:SystemRoot\System32\slmgr.vbs" /xpr

#----------------------------------------------------------
# Windows Update Scan
#----------------------------------------------------------

Write-Title "WINDOWS UPDATE"

UsoClient StartScan

Write-Success "Update Scan Started"

#----------------------------------------------------------
# Disk Cleanup
#----------------------------------------------------------

Write-Title "CLEANING TEMP FILES"

Remove-Item "$env:TEMP\*" `
-Recurse `
-Force `
-ErrorAction SilentlyContinue

Write-Success "Temporary Files Removed"

#----------------------------------------------------------
# Defender Quick Scan
#----------------------------------------------------------

Write-Title "WINDOWS DEFENDER QUICK SCAN"

Start-MpScan -ScanType QuickScan

Write-Success "Quick Scan Started"

#----------------------------------------------------------
# Generate Report
#----------------------------------------------------------

Write-Title "GENERATING REPORT"

$Report = "$LogFolder\SystemReport.txt"

Get-ComputerInfo | Out-File $Report

ipconfig /all >> $Report

Get-NetAdapter >> $Report

Get-Disk >> $Report

Get-Volume >> $Report

Get-Printer >> $Report

Write-Success "Report Saved"

Write-Host ""
Write-Host "Location: $Report"

#----------------------------------------------------------
# Finish
#----------------------------------------------------------

Write-Title "SETUP COMPLETE"

Write-Host "Log File:"
Write-Host $LogFile

Stop-Transcript

Write-Host ""
Write-Host "Setup Finished Successfully." -ForegroundColor Green

Pause