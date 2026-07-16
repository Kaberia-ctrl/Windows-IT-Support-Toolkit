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

function Show-PSMenu {
    Clear-Host
    Write-Host "====================================="
    Write-Host " WINDOWS IT SUPPORT TOOLKIT - PowerShell"
    Write-Host "====================================="
    Write-Host "[1] Run PC Setup"
    Write-Host "[2] Run Maintenance Script"
    Write-Host "[3] Run Diagnostic Script"
    Write-Host "[4] Run Network Troubleshooting Script"
    Write-Host "[5] Run Security Script"
    Write-Host "[6] Exit"
}

function Show-BatchMenu {
    Clear-Host
    Write-Host "====================================="
    Write-Host " WINDOWS IT SUPPORT TOOLKIT - Batch"
    Write-Host "====================================="
    Write-Host "[1] Run PC Setup"
    Write-Host "[2] Run Maintenance Script"
    Write-Host "[3] Run Diagnostic Script"
    Write-Host "[4] Run Network Troubleshooting Script"
    Write-Host "[5] Run Security Script"
    Write-Host "[6] Exit"
}

do {
    Show-Menu
    $main = Read-Host "Select"

    switch ($main) {
        "P" {
            Show-PSMenu
            $c = Read-Host "Select"
            if($c -eq'1'){ & ".\Powershell\PC Setup\setup.ps1"; Write-Log "Ran PC Setup"}
            if($c -eq'2'){ & ".\Powershell\Maintenance\maintenance.ps1"; Write-Log "Ran Maintenance Script"}
            if($c -eq'3'){ & ".\Powershell\Diagnostic\diagnostic.ps1"; Write-Log "Ran Diagnostic Script"}
            if($c -eq'4'){ & ".\Powershell\Network\test.ps1"; Write-Log "Ran Network Troubleshooting Script"}
            if($c -eq'5'){ & ".\Powershell\Security\security.ps1"; Write-Log "Ran Security Script"}
            if($c -eq'6'){ Write-Log "Exited PowerShell Menu"; break }
            default { Write-Host "Invalid option. Please try again." }
            pause
        }
        "B" {
            Show-BatchMenu
            $c = Read-Host "select"
            if($c -eq'1'){ Start-Process ".\Batch\PC Setup\setup.bat"; Write-Log "Ran PC Setup in Batch"}
            if($c -eq'2'){ Start-Process ".\Batch\Maintenance\maintenance.bat"; Write-Log "Ran Maintenance Script in Batch"}
            if($c -eq'3'){ Start-Process ".\Batch\Diagnostic\diag.bat"; Write-Log "Ran Diagnostic Script in Batch"}
            if($c -eq'4'){ Start-Process ".\Batch\Network\test.bat"; Write-Log "Ran Network Troubleshooting Script in Batch"}
            if($c -eq'5'){ Start-Process ".\Batch\Security\sec.bat"; Write-Log "Ran Security Script in Batch"}
            if($c -eq'6'){ Write-Log "Exited Batch Menu"; break }
            default { Write-Host "Invalid option. Please try again." }
            pause
        }
        "L" { Invoke- Item $LogDir }
    }
} while ($main -ne "Q")
Log-Message "User exited the application."
