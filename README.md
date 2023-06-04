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
As an Active Directory (AD) Administrator, our tasks generally revolve around managing user accounts, computers, groups, security, and other resources within a Windows domain environment. Here are some scripts that can be used.
|Script|Description|
|---|---|
|[Create_user.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/Create_user.ps1)|This PowerShell script facilitates the creation of an individual Active Directory user. It prompts for common user attributes such as first name, last name, full name, UPN, display name, office number, email, and path (OU). It also provides a mechanism for handling empty input fields, setting these as null in the user profile.|
|[create_bulk_users.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/create_bulk_users.ps1)|This PowerShell script is designed for bulk creation of Active Directory users. It imports user attributes from a specified CSV file and iteratively generates new user accounts. The CSV file should contain commonly required user details such as samAccountName, UserPrincipalName, GivenName, Surname, DisplayName, Email, Password, Enabled status, Path (OU), and OfficePhone.|
|[create_ADGroup.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/create_ADGroup.ps1)|This PowerShell script is designed to create a single Active Directory (AD) group. It prompts for the group's name and path (e.g., OU or CN=Users container). The script handles the difference between an Organizational Unit and the default "Users" container, ensuring correct group placement.|
|[create_bulk_ADGroups.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/create_bulk_ADGroups.ps1)|This PowerShell script is designed for the bulk creation of AD groups. It imports group details from a specified CSV file, which should include the group name and path (OU or CN=Users container). The script iteratively creates new AD groups according to the CSV file, handling differences between OUs and the default "Users" container, and delivers a confirmation of successful group creation.|

### Group Policy Objects (GPOs) 
Provide a flexible way to administer a wide variety of settings across the organization's network. Here are some common GPO recommendations that many organizaitons may find useful:

#### Password Policy: 
This GPO can set requirements for password complexity, length, and age. This helps ensure that users create strong passwords and change them regularly.
```
# Set the default domain password policy
Set-ADDefaultDomainPasswordPolicy -Identity "<YourDomainName>" `
    -ComplexityEnabled $true `
    -MaxPasswordAge 90.00:00:00 `
    -MinPasswordAge 0.00:00:00 `
    -MinPasswordLength 14 `
    -PasswordHistoryCount 24
```
1. Set-ADDefaultDomainPasswordPolicy: This is the command that sets the default domain password policy in Active Directory.
2. -Identity "<YourDomainName>": This is where you would replace "<YourDomainName>" with the name of your actual domain. The -Identity parameter specifies the domain for which the password policy will be set.
3. -ComplexityEnabled $true: This parameter sets the policy to require complex passwords. When enabled, passwords must meet the following minimum requirements:

    * Not contain the user's account name or parts of the user's full name that exceed two consecutive characters.
    * Be at least six characters in length.
    * Contain characters from three of the following four categories:
        * English uppercase characters (A through Z)
        * English lowercase characters (a through z)
        * Base 10 digits (0 through 9)
        * Non-alphabetic characters (for example, !, $, #, %)
4. -MaxPasswordAge 90.00:00:00: This parameter sets the maximum password age to 90 days. After 90 days, users will be required to change their password.
5. -MinPasswordAge 0.00:00:00: This parameter sets the minimum password age to 0 days. This means that users can change their password immediately after changing it.
6. -MinPasswordLength 14: This parameter sets the minimum password length to 14 characters.
7. -PasswordHistoryCount 24: This parameter sets the password history to 24. This means that the last 24 passwords for each user cannot be reused.
    
#### Account Lockout Policy: 
This policy can help protect against brute-force password attacks by locking an account after a certain number of failed login attempts.
```
# Set the account lockout threshold
Set-ADDefaultDomainPasswordPolicy -Identity "YourDomainName" `
    -LockoutThreshold 3
```
1. This sets the account lockout policy using the `Set-ADDefaultDomainPasswordPolicy` cmdlet in PowerShell.
2. This sets the account lockout policy for the domain, so after 3 invalid logon attempts, the account will be locked out.

#### Windows Firewall Settings: 
Use a GPO to ensure that the Windows Firewall is enabled and configured correctly on all computers in the domain.

There are 4 settings to be configured:
* Firewall state: This setting indicates whether the firewall is enabled or not. When the firewall state is "On", it's actively monitoring and filtering network traffic according to its rules. When it's "Off", it's not filtering or blocking any traffic.
* Inbound connections: This setting controls how incoming connections from the network are handled. If it's set to "Block", all incoming connections that do not match an allowed rule are blocked. If it's set to "Allow", incoming connections are allowed unless there's a rule specifically blocking them.
* Outboard connections: This setting controls how outgoing connections to the network are handled. If it's set to "Block", all outgoing connections that do not match an allowed rule are blocked. If it's set to "Allow", outgoing connections are allowed unless there's a rule specifically blocking them.
* Display a notification: This setting controls whether or not the system displays a notification when the firewall blocks a new app. If it's set to "Yes", users will be notified when a new app is blocked by the firewall. If it's set to "No", these notifications will not appear.

There are also 3 Profiles to be configured:
* Domain Profile: This profile is applied when your computer is connected to a network in which it can detect a domain controller for the domain to which the computer is joined. Essentially, this is the profile that should be active when the computer is connected to your workplace's domain network.
* Private Profile: The private profile is used when a computer is connected to a network that is identified as a private network, usually a network at home or in a small office where you trust people who also have access to this network. The settings in this profile are typically more relaxed than those in the domain or public profiles, because you trust the other devices on the network.
* Public Profile: The public profile is used when a computer is connected to a network that is identified as a public network, such as in a public place like a coffee shop, hotel, or airport. The public profile settings are usually the most restrictive because these networks are untrusted and you want to protect your computer from potentially harmful traffic.

```
# Set Domain Profile
Set-NetFirewallProfile -Profile Domain `
    -Enabled True `
    -DefaultInboundAction Block `
    -DefaultOutboundAction Allow `
    -NotifyOnListen False

# Set Private Profile
Set-NetFirewallProfile -Profile Private `
    -Enabled True `
    -DefaultInboundAction Block `
    -DefaultOutboundAction Allow `
    -NotifyOnListen False

# Set Public Profile
Set-NetFirewallProfile -Profile Public `
    -Enabled True `
    -DefaultInboundAction Block `
    -DefaultOutboundAction Allow `
    -NotifyOnListen True
```
Explainations:
Domain Profile: 
1. The Domain Profile settings are applied when your computer is connected to a domain network, such as at a workplace.
    * -Enabled True: This turns the firewall on for this profile, ensuring network traffic is monitored and filtered based on your firewall rules.
    * -DefaultInboundAction Block: This blocks all incoming connections that don't match an allowed rule. This is a good default setting to prevent unauthorized access to your system.
    * -DefaultOutboundAction Allow: This allows all outgoing connections unless there's a rule specifically blocking them. In a controlled domain environment, you often trust the outgoing connections as they are usually towards services that you manage.
    * -NotifyOnListen False: This disables notifications when a program is blocked from receiving inbound connections. In a domain environment, it's typically the system administrators who manage firewall settings, so end-users don't need to be notified.
2. Private Profile: The Private Profile settings are applied when your computer is connected to a trusted private network, like your home network.
    * The settings are the same as for the Domain Profile, assuming you trust your private network similarly to how you would trust a domain network.
3. Public Profile: The Public Profile settings are applied when your computer is connected to a public network, such as at a coffee shop or airport.
    * -Enabled True: This turns on the firewall for this profile. You always want your firewall enabled, but it's especially important when connected to a potentially unsafe public network.
    * -DefaultInboundAction Block: This blocks all incoming connections, providing a high level of security for untrusted public networks.
    * -DefaultOutboundAction Allow: This allows all outgoing connections unless there's a rule specifically blocking them. This is usually needed for web browsing, email, and other tasks. However, this could be made stricter, depending on your security needs.
    * -NotifyOnListen True: This enables notifications when a program is blocked from receiving inbound connections. It's often beneficial to have these notifications on public networks, where you might want to be more aware of what connections are being blocked.

#### Software Restriction Policies or AppLocker: 
These policies can be used to restrict or allow the execution of certain applications. This can prevent users from running potentially harmful software.

#### Update and Security Patch Policies: 
Use GPOs to ensure that all computers in the domain are regularly updated with the latest security patches.

#### User Rights Assignment: 
This policy allows you to define who has logon rights and privileges on the computer.

#### Audit Policy: 
Use this GPO to define what types of events are recorded in the security log on your computers.

#### USB Block Policy: 
This policy restricts the use of removable storage devices, which can help prevent data theft and the introduction of malware.

#### Screen Lock Policy: 
This policy requires that a password be entered after a computer has been idle for a certain amount of time.

#### Least Privilege User Access (LUA): 
Users should operate with the lowest level of user rights required for their work. This means users should not have administrative privileges unless absolutely necessary.

These PowerShell scripts provide users with quick tools for managing and retrieving data required from AD.
|Script|Description|
|---|---|
|[getDepartmentsAndUsers.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/getDepartmentsAndUsers.ps1)|This script is designed to efficiently fetch all the departments listed in your Active Directory and simultaneously count the number of user accounts linked to each of these departments.|
|[get_mailing_list.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/get_mailing_list.ps1)|This handy script is tasked with collecting all the Mailing Lists in Active Directory, offering an easy way to audit or update your mailing lists.|
|[get_email_status.ps1](https://github.com/beepbomark/Useful-Scripts/blob/main/PowerShell%20Scripts/get_email_status.ps1)|This script demonstrates its utility by using the "Email" column in a given CSV file to search for the corresponding AD account. It then checks the account status (enabled or disabled) and updates this status in the file.|