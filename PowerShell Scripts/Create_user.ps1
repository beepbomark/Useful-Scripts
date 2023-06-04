# Prompt for user details
$firstName = Read-Host -Prompt "Enter first name"
$middleName = Read-Host -Prompt "Enter middle name"
$lastName = Read-Host -Prompt "Enter last name"
$fullName = Read-Host -Prompt "Enter full name"
$upn = Read-Host -Prompt "Enter UPN"
$displayName = Read-Host -Prompt "Enter display name"
$officeNumber = Read-Host -Prompt "Enter office number"
$email = Read-Host -Prompt "Enter email"
$path = Read-Host -Prompt "Enter OU path (like 'OU=Sales,DC=YourDomain,DC=com')"

# Check if each field is empty and set to null if true
if (-not $firstName) {$firstName = $null}
if (-not $middleName) {$middleName = $null}
if (-not $lastName) {$lastName = $null}
if (-not $fullName) {$fullName = $null}
if (-not $upn) {$upn = $null}
if (-not $displayName) {$displayName = $null}
if (-not $officeNumber) {$officeNumber = $null}
if (-not $email) {$email = $null}
if (-not $path) {$path = $null}

# Set default password
$password = ConvertTo-SecureString -String "DefaultPassword123" -AsPlainText -Force

# Create new AD User
New-ADUser -Name $fullName -GivenName $firstName -Surname $lastName -UserPrincipalName $upn -DisplayName $displayName -OfficePhone $officeNumber -EmailAddress $email -AccountPassword $password -Enabled $true -Path $path -PassThru

Write-Output "User created successfully!"
