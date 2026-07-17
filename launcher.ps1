$LogFolder = "$PSScriptRoot\Logs"
if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}
# Base path (works whether run from a script or console)
$BasePath = if ($PSScriptRoot) { $PSScriptRoot } else { Get-Location }

# Log folder
$LogFolder = Join-Path $BasePath "Logs"

# Create Logs folder if it doesn't exist
if (!(Test-Path $LogFolder)) {
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

# Log file
$LogFile = Join-Path -Path $LogFolder -ChildPath "Setup_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').log"

function Write-Log {
    param (
        [string]$Message
    )
    $Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $LogEntry = "$Timestamp - $Message"
    Write-Host $LogEntry
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
            {default { Write-Host "Invalid option. Please try again." }
            pause
        }
        }
        "B" {
            Show-Menu
            if($main -eq'B'){ Start-Process ".\Batch\setup.bat"; Write-Log "Ran PC Setup in Batch"}
            {default { Write-Host "Invalid option. Please try again." }
            pause
        }
        }
        "L" { Invoke-Item $LogFolder }
    }
} while ($main -ne "Q")
Write-Log "User exited the application."
