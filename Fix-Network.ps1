# Fix-Network.ps1
# Script to reset network IP and flush DNS for troubleshooting connectivity issues.
#requires -RunAsAdministrator

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

Write-Host "`n✅ Network reset complete! Please try reconnecting or reloading your services." -ForegroundColor Green

Read-Host -Prompt "Press Enter to exit"
