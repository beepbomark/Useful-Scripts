$EdgeUserDataPath = "$env:LOCALAPPDATA\Microsoft\Edge\User Data"

if (Test-Path $EdgeUserDataPath) {
    $ProfileDirectories = Get-ChildItem -Path $EdgeUserDataPath -Directory | Where-Object { $_.Name -match "^Profile|^Default" }

    if ($ProfileDirectories) {
        Write-Host "Clearing Microsoft Edge browsing history for all profiles..."

        foreach ($ProfileDir in $ProfileDirectories) {
            $HistoryPath = Join-Path $ProfileDir.FullName "History*"
            Write-Host "Clearing browsing history for profile $($ProfileDir.Name)..."

            try {
                Remove-Item -Path $HistoryPath -Force -Recurse -ErrorAction Stop
                Write-Host "Browsing history cleared for profile $($ProfileDir.Name)."
            } catch {
                Write-Warning "An error occurred while clearing browsing history for profile $($ProfileDir.Name)."
            }
        }
    } else {
        Write-Host "No Microsoft Edge profiles found."
    }
} else {
    Write-Host "Microsoft Edge user data not found."
}
