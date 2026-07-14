# Windows IT Support Toolkit

A collection of Windows Batch and PowerShell scripts designed to assist IT support technicians with workstation deployment, system maintenance, troubleshooting, diagnostics, networking, reporting, and basic system administration.

This project demonstrates practical IT support skills and Windows administration tasks commonly performed in help desk, desktop support, and system administration environments.

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

## 📁 Project Structure

```
Windows-IT-Support-Toolkit/
│
├── README.md
├── LICENSE
├── CHANGELOG.md
│
├── launcher.bat
├── setup.bat
│
├── modules/
│   ├── workstation-setup.bat
│   ├── maintenance.bat
│   ├── diagnostics.bat
│   ├── networking.bat
│   ├── security.bat
│   ├── backup.bat
│   ├── reports.bat
│   ├── software.bat
│   └── troubleshooting.bat
│
├── powershell/
│   ├── system-report.ps1
│   ├── battery-report.ps1
│   ├── disk-health.ps1
│   └── user-audit.ps1
│
├── logs/
├── reports/
├── screenshots/
└── assets/
```

---
## Requirements

- Windows 10 or Windows 11
- Administrator privileges (recommended)
- Windows PowerShell 5.1 or later

---

## Installation

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/Windows-IT-Support-Toolkit.git
```

Or download the ZIP file from GitHub and extract it.

---

## Running the Toolkit

Navigate to the project folder.

Run:

```
launcher.bat
```

or right-click **launcher.bat** and select **Run as Administrator**.

---

## Toolkit Menu

The launcher provides access to the available modules.

Example:

```
====================================
WINDOWS IT SUPPORT TOOLKIT
====================================

1. Workstation Setup
2. Maintenance
3. Diagnostics
4. Networking
5. Security
6. Backup
7. Reports
8. Software
9. Troubleshooting
0. Exit
```

---

# 📂 Modules

## Workstation Setup

Performs basic workstation preparation tasks including:

- Display system information
- Create support folders
- Flush DNS cache
- Display network configuration
- Open Windows Update
- Prepare workstation for deployment

---

## Maintenance

Includes routine maintenance tasks such as:

- Disk Cleanup
- Temporary file cleanup
- Disk health checks
- System File Checker (SFC)

---

## Diagnostics

Collects diagnostic information including:

- Hardware information
- Operating system details
- Running services
- Installed software
- Event logs

---

## Networking

Provides networking utilities including:

- IP configuration
- DNS cache flush
- Ping tests
- Network adapter information
- Winsock reset

---

## Security

Performs basic security checks:

- Windows Defender status
- Firewall status
- Windows Update status
- User Account Control (UAC)

---

## Backup

Backup utilities for:

- User files
- Important folders
- Configuration backups

---

## Reports

Generates reports including:

- System Information
- Hardware Information
- Network Information
- Windows Version
- User Information

Reports are saved inside the **reports** folder.

---

## Software

Provides software management tasks such as:

- Install software using Winget
- List installed programs
- Update installed packages

---

## Troubleshooting

Common troubleshooting tools including:

- Restart Windows Explorer
- Network reset
- DNS repair
- SFC Scan
- DISM Health Restore

---

# 📜 PowerShell Scripts

The **powershell** folder contains advanced automation scripts.

| Script | Description |
|---------|-------------|
| system-report.ps1 | Generates a detailed system report |
| battery-report.ps1 | Creates a battery health report |
| disk-health.ps1 | Displays disk status |
| user-audit.ps1 | Lists local users and account information |

---

# 📁 Logs

Execution logs are stored inside:

```
logs/
```

---

# 📊 Reports

Generated reports are stored inside:

```
reports/
```

---

# 🖼 Screenshots

Example screenshots of the toolkit can be placed inside:

```
screenshots/
```

---

# 🛠 Technologies Used

- Windows Batch
- PowerShell
- Windows Administration
- Command Prompt
- Git
- GitHub

---

# 🎯 Skills Demonstrated

- Windows System Administration
- Desktop Support
- IT Help Desk
- Technical Troubleshooting
- Networking
- Windows Security
- Automation
- Batch Scripting
- PowerShell Scripting
- Documentation
- Version Control (Git)

---

# 📚 Learning Objectives

This project was created to demonstrate practical IT support skills while building a professional portfolio for roles including:

- IT Support Technician
- Help Desk Analyst
- Desktop Support Technician
- System Administrator
- ICT Support Officer

---

# 🔄 Future Improvements

- GUI launcher
- Automated software deployment
- Active Directory support
- Microsoft Entra ID integration
- Printer deployment
- Remote support utilities
- Inventory reporting
- Scheduled maintenance
- Registry backup
- Event Log analysis

---

# 🤝 Contributing

Contributions, suggestions and improvements are accepted.

Feel free to contribute to the repository and submit a pull request.

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