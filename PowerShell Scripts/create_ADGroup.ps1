# Prompt for group details
$groupName = Read-Host -Prompt "Enter group name"
$groupPath = Read-Host -Prompt "Enter group path (like 'OU=Groups,DC=YourDomain,DC=com')"

# Create new AD Group
New-ADGroup -Name $groupName -Path $groupPath -GroupScope Global -PassThru

Write-Output "Group created successfully!"