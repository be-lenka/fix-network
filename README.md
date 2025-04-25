# 🛠 Network Fix Utility

This repository contains two PowerShell scripts to help Windows users quickly reset their network settings, such as renewing IP configuration and flushing DNS cache.

## 📁 Files

### `Fix-Network.ps1`
- Requires **administrator privileges**.
- Performs the following:
  - Releases current IP address.
  - Renews IP address via DHCP.
  - Flushes DNS cache using both `ipconfig` and PowerShell native command.
- Includes elevation enforcement using `#requires -RunAsAdministrator`.

### `Fix-Network-NoAdmin.ps1`
- **Does not require admin rights.**
- Attempts to:
  - Release and renew IP address.
  - Flush DNS cache using `ipconfig`.
  - Gracefully handle permission-limited operations.
- Ideal for use by end-users without administrative access.

---

## 🚀 Usage

### Option 1: Run as PowerShell script

## Admin version
```powershell
powershell -ExecutionPolicy Bypass -File .\\Fix-Network.ps1
```

## Non-admin version
```powershell
powershell -ExecutionPolicy Bypass -File .\\Fix-Network-NoAdmin.ps1
```

### Option 2: Compile to `.exe`

## Install ps2exe if needed
```powershell
Install-Module -Name ps2exe -Scope CurrentUser
```

## Compile
```powershell
Invoke-ps2exe .\\Fix-Network.ps1 .\\Fix-Network.exe
Invoke-ps2exe .\\Fix-Network-NoAdmin.ps1 .\\Fix-Network-NoAdmin.exe
```

### Option 3: Download & Run

You can download the scripts directly from the repository and run them without needing to clone it.
- [Fix-Network.ps1](https://raw.githubusercontent.com/be-lenka/fix-network/master/Fix-Network.ps1)

- [Fix-Network-NoAdmin.ps1](https://raw.githubusercontent.com/be-lenka/fix-network/master/Fix-Network-NoAdmin.ps1) 

If you're able to run the programs under your user with elevated priviledges, use **Fix-Network.ps1** otherwise, use **Fix-Network-NoAdmin.ps1** (preffered).

1. Access download folder
2. Double click on the `Fix-Network-NoAdmin.ps1` 

After the program run is finished, you should be able to re-connect to the network like before. Enjoy!


> ⚠️ Note: Running the admin version requires launching PowerShell **as Administrator**.