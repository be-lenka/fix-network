# Fix-Network-NoAdmin.ps1
# User-friendly script to refresh IP and flush DNS without admin rights

Write-Host "🔄 Starting basic network refresh..." -ForegroundColor Cyan

# Step 1: Try releasing IP (may partially succeed without admin)
Write-Host "`nTrying to release IP address..."
try {
    ipconfig /release
} catch {
    Write-Host "⚠️ Could not release IP. Admin rights may be required." -ForegroundColor Yellow
}

# Step 2: Try renewing IP
Write-Host "`nTrying to renew IP address..."
try {
    ipconfig /renew
} catch {
    Write-Host "⚠️ Could not renew IP. Admin rights may be required." -ForegroundColor Yellow
}

# Step 3: Flush DNS using ipconfig (usually OK without admin)
Write-Host "`nFlushing DNS cache..."
try {
    ipconfig /flushdns
    Write-Host "✅ DNS cache flushed."
} catch {
    Write-Host "⚠️ Could not flush DNS cache." -ForegroundColor Yellow
}

# Step 4: Try Clear-DnsClientCache (will fail silently if blocked)
Write-Host "`nAttempting additional DNS cache clear (non-critical)..."
try {
    Clear-DnsClientCache
    Write-Host "✅ PowerShell DNS cache clear completed."
} catch {
    Write-Host "ℹ️ Skipped: PowerShell DNS clear not permitted in user mode."
}

Write-Host "`n🎉 Done! Try refreshing your browser or reconnecting to Wi-Fi." -ForegroundColor Green

Read-Host -Prompt "Press Enter to exit"
