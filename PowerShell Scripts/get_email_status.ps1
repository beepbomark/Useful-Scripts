# Prompt for the CSV file path
$filePath = Read-Host -Prompt 'Input your CSV file path'

# Load the CSV file
$csvData = Import-Csv -Path $filePath

# Add a new column to your CSV for the status
$csvData = $csvData | Select *,@{Name='Status';Expression={''}}

# Loop over the rows in the CSV
foreach ($row in $csvData) {

    # Check if the Email column exists
    if ($row.PSObject.Properties.Name -contains 'Email') {
    
        # Fetch the user from Active Directory
        $user = Get-ADUser -Filter "EmailAddress -eq '$($row.Email)'" -Properties Enabled

        if($user){
            # Check if the user is enabled
            if ($user.Enabled -eq $true) {
                $row.Status = 'Enabled'
            } else {
                $row.Status = 'Disabled'
            }
        } else {
            $row.Status = 'Not Found'
        }
    } else {
        Write-Output "No Email column found in CSV file."
        break
    }
}

# Export the CSV file with the added Status column
$csvData | Export-Csv $filePath -NoTypeInformation