$FirefoxProfilesPath = "$env:APPDATA\Mozilla\Firefox\Profiles"

if (Test-Path $FirefoxProfilesPath) {
    $ProfileDirectories = Get-ChildItem -Path $FirefoxProfilesPath -Directory

    if ($ProfileDirectories) {
        Write-Host "Clearing Mozilla Firefox browsing history for all profiles..."

        foreach ($ProfileDir in $ProfileDirectories) {
            $HistoryPath = Join-Path $ProfileDir.FullName "places.sqlite"
            Write-Host "Clearing browsing history for profile $($ProfileDir.Name)..."

            try {
                Remove-Item -Path $HistoryPath -Force -ErrorAction Stop
                Write-Host "Browsing history cleared for profile $($ProfileDir.Name)."
            } catch {
                Write-Warning "An error occurred while clearing browsing history for profile $($ProfileDir.Name)."
            }
        }
    } else {
        Write-Host "No Mozilla Firefox profiles found."
    }
} else {
    Write-Host "Mozilla Firefox user data not found."
}
