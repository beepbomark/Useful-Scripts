# Reset network adapters
Write-Host "Resetting network adapters..."
netsh winsock reset
netsh int ip reset

# Release and renew IP addresses
Write-Host "Releasing and renewing IP addresses..."
$interfaces = Get-NetAdapter | Where-Object { $_.Status -eq "Up" }

foreach ($interface in $interfaces) {
    Write-Host "Releasing IP address for $($interface.Name)..."
    ipconfig /release $($interface.Name)

    Write-Host "Renewing IP address for $($interface.Name)..."
    ipconfig /renew $($interface.Name)
}

# Flush DNS cache
Write-Host "Flushing DNS resolver cache..."
ipconfig /flushdns

Write-Host "Network connections reset and refreshed."
