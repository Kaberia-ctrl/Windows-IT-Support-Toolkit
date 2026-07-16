$LogDir = "$PSPowershell\Logs"
if (-not (Test-Path -Path $LogDir)) {
    New-Item -ItemType Directory -Path $LogDir | Out-Null
}
$LogFile = Join-Path -Path $LogDir -ChildPath "launcher.log"

function Log-Message {
    param (
        [string]$Message
    )
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogEntry = "$Timestamp - $Message"
    Add-Content -Path $LogFile -Value $LogEntry
}

function Show-Menu {
    Clear-Host
    Write-Host "====================================="
    Write-Host " WINDOWS IT SUPPORT TOOLKIT"
    Write-Host "====================================="
    Write-Host "[P]. Run PowerShell Script"
    Write-Host "[B]. Run Batch Script"
    Write-Host "[L]. View Logs"
    Write-Host "[Q]. Quit"
}

do {
    Show-Menu
    $main = Read-Host "Select"

    switch ($main) {
        "P" {
            Show-Menu 
            if($main -eq'P'){ & ".\Powershell\setup.ps1"; Write-Log "Ran PC Setup"}
            default { Write-Host "Invalid option. Please try again." }
            pause
        }
        "B" {
            Show-Menu
            if($main -eq'B'){ Start-Process ".\Batch\setup.bat"; Write-Log "Ran PC Setup in Batch"}
            default { Write-Host "Invalid option. Please try again." }
            pause
        }
        "L" { Invoke- Item $LogDir }
    }
} while ($main -ne "Q")
Log-Message "User exited the application."
