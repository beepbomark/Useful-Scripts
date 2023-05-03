$ChromeUserDataPath = "$env:LOCALAPPDATA\Google\Chrome\User Data"

if (Test-Path $ChromeUserDataPath) {
    $ProfileDirectories = Get-ChildItem -Path $ChromeUserDataPath -Directory | Where-Object { $_.Name -match "^Profile|^Default" }
    
    if ($ProfileDirectories) {
        Write-Host "Clearing Google Chrome browsing history for all profiles..."

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
        Write-Host "No Google Chrome profiles found."
    }
} else {
    Write-Host "Google Chrome user data not found."
}
