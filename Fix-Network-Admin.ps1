# Fix-Network.ps1
# Script to reset network IP and flush DNS for troubleshooting connectivity issues.

Write-Host "🚧 Starting network repair process..." -ForegroundColor Cyan

# Releasing current IP address
Write-Host "`nReleasing current IP address..."
ipconfig /release

# Renewing IP address
Write-Host "`nRequesting new IP address..."
ipconfig /renew

# Flushing DNS using ipconfig
Write-Host "`nFlushing DNS cache (via ipconfig)..."
ipconfig /flushdns

# Flushing DNS using PowerShell cmdlet
Write-Host "`nFlushing DNS cache (via Clear-DnsClientCache)..."
Clear-DnsClientCache

# Optional: Restart network adapter (commented out for safety)
# Write-Host "`nRestarting network adapter..."
# Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Restart-NetAdapter -Confirm:$false

Write-Host "`n✅ Network reset complete! Please try reconnecting or reloading your services." -ForegroundColor Green

Read-Host -Prompt "Press Enter to exit"
