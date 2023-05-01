$interfaces = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.MediaType -ne "802.3" }
$foundManualConfig = $false

foreach ($interface in $interfaces) {
    $IPv4AddressConfiguration = Get-NetIPConfiguration -InterfaceIndex $interface.ifIndex | Where-Object { $_.AddressFamily -eq "IPv4" }
    
    if ($IPv4AddressConfiguration.Dhcp -eq "Disabled") {
        $foundManualConfig = $true
        Write-Host "Interface $($interface.Name) is not set to obtain an IP address automatically, changing it to automatic..."
        
        try {
            Set-DnsClientServerAddress -InterfaceIndex $interface.ifIndex -ResetServerAddresses
            Set-NetIPInterface -InterfaceIndex $interface.ifIndex -Dhcp Enabled
            Write-Host "Interface $($interface.Name) has been changed to obtain an IP address automatically."
        } catch {
            Write-Warning "Failed to change IPv4 settings for $($interface.Name) to automatic."
        }
    } else {
        Write-Host "Interface $($interface.Name) is already set to obtain an IP address automatically."
    }
}

if (-not $foundManualConfig) {
    Write-Host "All network interfaces are already set to obtain an IP address automatically."
}
