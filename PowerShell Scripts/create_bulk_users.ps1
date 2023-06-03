# Import CSV
$csvPath = Read-Host -Prompt "Enter the path to the CSV file"
$users = Import-Csv -Path $csvPath

# Loop over each user and create a new user
foreach ($user in $users) {
    $password = ConvertTo-SecureString -String $user.Password -AsPlainText -Force
    New-ADUser -Name $user.Name -GivenName $user.GivenName -Surname $user.Surname -UserPrincipalName $user.UserPrincipalName -SamAccountName $user.samAccountName -DisplayName $user.DisplayName -OfficePhone $user.OfficePhone -EmailAddress $user.Email -AccountPassword $password -Enabled $true -Path $user.Path -PassThru
}

Write-Output "Users created successfully!"