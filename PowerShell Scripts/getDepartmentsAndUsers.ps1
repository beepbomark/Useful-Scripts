# Retrieve all active user objects with a non-empty department attribute
$users = Get-ADUser -Filter { department -like "*" -and Enabled -eq $true } -Properties Department

# Group users by department and count the number of users in each department
$departmentUserCounts = $users | Group-Object -Property Department | Select-Object Name, Count

# Export the department names and user counts to a CSV file
$departmentUserCounts | Export-Csv -Path "DepartmentAndUsers.csv" -NoTypeInformation
