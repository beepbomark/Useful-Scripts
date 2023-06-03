# Useful-Scripts
A collection of PowerShell and Command-Line scripts designed to simplify and streamline daily tasks, showcasing my proficiency in PowerShell and Command-Line.

## Deleting and clearing browser history and cookies
The PowerShell scripts below allow users to clear browsing history and cookies for Google Chrome, Microsoft Edge, and Mozilla Firefox, resolving browser issues and improving privacy.
|Script|Description|
|------|-----------|
|[delete_chrome_browsing_history.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/delete_chrome_browsing_history.ps1)|Clears browsing history and cookies for all Google Chrome profiles|
|[delete_edge_browsing_history.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/delete_edge_browsing_history.ps1)|Clears browsing history and cookies for all Microsoft Edge profiles.|
|[delete_mozilla_browsing_history.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/delete_mozilla_browsing_history.ps1)|Clears browsing history and cookies for all Mozilla Firefox profiles.|

## Batch Files for Non-Administrative Users
These batch files allow users without administrator rights to terminate specific applications. To use them, double-click the corresponding .bat file or execute it in a Command Prompt window.

|Script|Description|
|------|-----------|
|[kill_adobe.bat](https://github.com/beepbomark/Useful-Scripts/blob/main/Scripts/kill_adobe.bat)|Terminates Adobe Reader and Acrobat Pro.|
|[kill_chrome.bat](https://github.com/beepbomark/Useful-Scripts/blob/main/Scripts/kill_chrome.bat)|Terminates Google Chrome.|
|[kill_office.bat](https://github.com/beepbomark/Useful-Scripts/blob/main/Scripts/kill_office.bat)|Terminates ALL Office applications.|
|[kill_restart_fileExplorer.bat](https://github.com/beepbomark/Useful-Scripts/blob/main/Scripts/kill_restart_filleExplorer.bat)|Terminates and Restarts File Explorer.|
|[kill_zoom.bat](https://github.com/beepbomark/Useful-Scripts/blob/main/Scripts/kill_zoom.bat)|Terminates Zoom.|

## Powershell Scripts for Admin Users
These PowerShell scripts provide Admin users with quick tools for managing network connections and applications.
|Script|Description|
|------|-----------|
|[check_network_connections.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/check_network_connections.ps1)|To check if IPv4 settings are set to obtain an IP address automatically, and change them to automatic if they are not.|
|[kill_unresponsive_apps.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/kill_unresponsive_apps.ps1)|Terminates all unresponsive applications currently running on the system.|
|[reset_network_connections.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/reset_network_connections.ps1)|Resets and refreshes all network connections, including releasing and renewing IP addresses and flushing the DNS cache.|

## Scripts to use in Active Directory
As an Active Directory (AD) administrator, our tasks generally revolve around managing user accounts, computers, groups, security, and other resources within a Windows domain environment. Here are some scripts that can be used.
|Script|Description|
|---|---|
|[Create_user.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/Create_user.ps1)|This PowerShell script facilitates the creation of an individual Active Directory user. It prompts for common user attributes such as first name, last name, full name, UPN, display name, office number, email, and path (OU). It also provides a mechanism for handling empty input fields, setting these as null in the user profile.|
|[create_bulk_user.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/create_bulk_user.ps1)|This PowerShell script is designed for bulk creation of Active Directory users. It imports user attributes from a specified CSV file and iteratively generates new user accounts. The CSV file should contain commonly required user details such as samAccountName, UserPrincipalName, GivenName, Surname, DisplayName, Email, Password, Enabled status, Path (OU), and OfficePhone.|
|[create_ADGroup.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/create_ADGroup.ps1)|This PowerShell script is designed to create a single Active Directory (AD) group. It prompts for the group's name and path (e.g., OU or CN=Users container). The script handles the difference between an Organizational Unit and the default "Users" container, ensuring correct group placement.|
|[create_bulk_ADGroups.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/create_ADGroup.ps1)|This PowerShell script is designed for the bulk creation of AD groups. It imports group details from a specified CSV file, which should include the group name and path (OU or CN=Users container). The script iteratively creates new AD groups according to the CSV file, handling differences between OUs and the default "Users" container, and delivers a confirmation of successful group creation.|


These PowerShell scripts provide users with quick tools for managing and retrieving data required from AD.
|Script|Description|
|---|---|
|[getDepartmentsAndUsers.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/getDepartmentsAndUsers.ps1)|This script is designed to efficiently fetch all the departments listed in your Active Directory and simultaneously count the number of user accounts linked to each of these departments.|
|[get_mailing_list.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/get_mailing_list.ps1)|This handy script is tasked with collecting all the Mailing Lists in Active Directory, offering an easy way to audit or update your mailing lists.|
|[get_email_status.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/get_email_status.ps1)|This script demonstrates its utility by using the "Email" column in a given CSV file to search for the corresponding AD account. It then checks the account status (enabled or disabled) and updates this status in the file.|