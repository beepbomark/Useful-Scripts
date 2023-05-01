$unresponsiveProcesses = Get-Process | Where-Object { $_.Responding -eq $false }

foreach ($process in $unresponsiveProcesses) {
    Write-Host "Terminating unresponsive process: $($process.Name) (PID: $($process.Id))"
    try {
        $process | Stop-Process -Force
    } catch {
        Write-Warning "Failed to terminate process: $($process.Name) (PID: $($process.Id))"
    }
}

if ($unresponsiveProcesses.Count -eq 0) {
    Write-Host "No unresponsive processes found."
} else {
    Write-Host "All unresponsive processes terminated."
}
