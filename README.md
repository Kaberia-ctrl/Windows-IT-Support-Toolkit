# Windows IT Support Toolkit

A collection of Windows Batch and PowerShell scripts designed to assist IT support technicians with workstation deployment, system maintenance, troubleshooting, diagnostics, networking, reporting, and basic system administration.

---

## Features

- Workstation setup and configuration
- System maintenance
- Network diagnostics and troubleshooting
- Windows security checks
- Backup utilities
- System reporting
- Software management
- Basic troubleshooting tools
- PowerShell automation

---

## Project Structure

```
└── Windows-IT-Support-Toolkit/
│       ├── launcher.bat
|       ├── launcher.ps1
|       |
│       ├── Batch/
|       |    └── PC setup/
│       |        ├── README.md
|       |        └── setup.bat
|       |
│       |    └── Maintenance/
│       |        ├── README.md
|       |        └── maintenance.bat
|       |
|       |    └── Diagnostics/
│       |        ├── README.md
|       |        └── diag.bat
|       |
|       |    └── Network/
│       |        ├── README.md
|       |        └── test.bat
|       |
|       |    └── Security/
│       |        ├── README.md
|       |        └── sec.bat
|       |
│       ├── Powershell/
|       |   └── PC setup/
│       |        ├── README.md
|       |        └── setup.ps1
│       |   └── Maintenance/
│       |        ├── README.md
|       |        └── maintenance.ps1
|       |   └── Network/
│       |        ├── README.md
|       |        └── test.ps1
|       |
│       ├── logs/
│       ├── reports/
│       ├── screenshots/
│       └── assets/
└── README.md
```

---
## Requirements

- Windows 10 or Windows 11 / Server 2016+
- Run as Administrator
- For Powershell: 'Set-ExectuionPolicy RemoteSigned'
- Administrator privileges (recommended)
- Windows PowerShell 5.1 or later

---

## Installation

Clone the repository:

```bash
git clone https://github.com/kaberia-ctrl/Windows-IT-Support-Toolkit.git
```

Or download the ZIP file from GitHub and extract it.

---

## Running the Toolkit

1. Download and unzip this repo
2. Right-click 'launcher.ps1' > Run as Administrator
3. Select 'P' for Powershell and 'B' for Batch
---

## Toolkit Menu

The launcher provides access to the available scripts.

```
====================================
WINDOWS IT SUPPORT TOOLKIT
====================================

1. PC Setup
2. Maintenance
3. Network
4. Diagnostics
5. Networking
6. Security
0. Exit
```

# Script Categories

The **Windows-IT-Support Toolikt** folder contains advanced automation scripts.

Category | Script | Use case |
|---------|-------------|
| **Setup** | New PC setup |
| **Maintenance** | Performs cleanup and updates |
| **Networking** | Test connectivity and network status |
| **Diagnostics** | Runs a system diagnostics |
| **Security** | Troubleshoots   |

---

# 📄 License

This project is licensed under the MIT License.

---

# 👨‍💻 Author

**Victor Kamau**

ICT Support | Desktop Support | System Administration | Windows Administration

GitHub:
https://github.com/Kaberia-ctrl

---

## ⭐ If you found this project useful, consider giving it a star.