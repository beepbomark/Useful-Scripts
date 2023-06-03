# Import CSV
$csvPath = Read-Host -Prompt "Enter the path to the CSV file"
$groups = Import-Csv -Path $csvPath

# Loop over each group and create a new group
foreach ($group in $groups) {
    # Check if 'CN=Users' is in the path
    if ($group.GroupPath -like "*CN=Users*") {
        # Create group in the 'CN=Users' container
        New-ADGroup -Name $group.GroupName -SamAccountName $group.GroupName -GroupScope Global -PassThru
    } else {
        # Create group in the specified OU
        New-ADGroup -Name $group.GroupName -Path $group.GroupPath -GroupScope Global -PassThru
    }
}

Write-Output "Groups created successfully!"