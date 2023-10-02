# Import Active Directory module
Import-Module ActiveDirectory

# Define the number of days since last logon to consider an account as dormant
$daysThreshold = 90

# Get the current date
$currentDate = Get-Date

# Create an array to store the results
$report = @()

# Get a list of all Active Directory users
$users = Get-ADUser -Filter * -Properties SamAccountName, LastLogon

# Loop through each user and check their last logon date
foreach ($user in $users) {
    $lastLogon = $user.LastLogon

    # Check if the LastLogon property is not null
    if ($lastLogon) {
        # Convert the LastLogon date to a readable format
        $lastLogonDate = [DateTime]::FromFileTime($lastLogon)

        # Calculate the number of days since last logon
        $daysSinceLastLogon = ($currentDate - $lastLogonDate).Days

        # Check if the account is dormant based on the daysThreshold
        if ($daysSinceLastLogon -ge $daysThreshold) {
            $userInfo = [PSCustomObject]@{
                Name           = $user.Name
                SamAccountName = $user.SamAccountName
                LastLogon      = $lastLogonDate
                Date           = $currentDate
            }
            $report += $userInfo
        }
    }
}

# Sort the results by LastLogon date in descending order
$report = $report | Sort-Object -Property LastLogon -Descending

# Export the results to a CSV file
$report | Export-Csv -Path "C:\temp\DormantAccountsReport.csv" -NoTypeInformation
