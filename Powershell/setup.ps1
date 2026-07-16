Clear-Host

$ReportFolder="$PSScriptRoot\..\..\reports"
$LogFolder="$PSScriptRoot\..\..\logs"

New-Item -ItemType Directory -Force $ReportFolder | Out-Null
New-Item -ItemType Directory -Force $LogFolder | Out-Null

$Report="$ReportFolder\SystemReport.txt"
$Log="$LogFolder\SystemInfo.log"

function Write-Log($Message)
{
    Add-Content $Log "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Message"
}

Write-Log "System information collection started."

"==========================================" | Out-File $Report
"WINDOWS SYSTEM INFORMATION REPORT" | Out-File $Report -Append
"==========================================" | Out-File $Report -Append
Get-Date | Out-File $Report -Append

"`nComputer Name" | Out-File $Report -Append
$env:COMPUTERNAME | Out-File $Report -Append

"`nLogged-in User" | Out-File $Report -Append
$env:USERNAME | Out-File $Report -Append

"`nWindows Information" | Out-File $Report -Append
Get-ComputerInfo |
Select WindowsProductName,
WindowsVersion,
OsBuildNumber |
Out-File $Report -Append

"`nProcessor" | Out-File $Report -Append
Get-CimInstance Win32_Processor |
Select Name,NumberOfCores,MaxClockSpeed |
Out-File $Report -Append

"`nMemory" | Out-File $Report -Append
Get-CimInstance Win32_ComputerSystem |
Select TotalPhysicalMemory |
Out-File $Report -Append

"`nDisk Information" | Out-File $Report -Append
Get-Volume |
Select DriveLetter,
FileSystemLabel,
SizeRemaining,
Size |
Out-File $Report -Append

"`nIP Addresses" | Out-File $Report -Append
Get-NetIPAddress |
Where-Object AddressFamily -eq IPv4 |
Out-File $Report -Append

"`nNetwork Adapters" | Out-File $Report -Append
Get-NetAdapter |
Out-File $Report -Append

"`nRunning Services" | Out-File $Report -Append
Get-Service |
Sort-Object Status |
Out-File $Report -Append

"`nInstalled Hotfixes" | Out-File $Report -Append
Get-HotFix |
Out-File $Report -Append

"`nLogical Disks" | Out-File $Report -Append
Get-CimInstance Win32_LogicalDisk |
Out-File $Report -Append

Write-Log "System information report completed."

Write-Host ""
Write-Host "==========================================" -ForegroundColor Green
Write-Host "System Information Report Generated"
Write-Host "==========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Report Location:"
Write-Host $Report -ForegroundColor Cyan
Write-Host ""