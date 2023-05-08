# Define the LDAP filter to get distribution groups or mail-enabled security groups
$ldapFilter = "(&(mail=*)(|(groupType=-2147483640)(groupType=-2147483646)))"

# Retrieve all mailing lists in Active Directory (distribution groups or mail-enabled security groups)
$mailingLists = Get-ADGroup -LDAPFilter $ldapFilter -Properties mail, msExchHideFromAddressLists

# Export the mailing list information to a CSV file, including the hidden status
$mailingLists | Select-Object Name, GroupCategory, mail, msExchHideFromAddressLists, DistinguishedName | Export-Csv -Path "MailingLists.csv" -NoTypeInformation
