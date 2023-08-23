# Script: Export PC Application List to Excel
# Description: Retrieves a list of installed applications from WMI and exports it to an Excel file.

# Import the module for Export-Excel cmdlet
Import-Module -Name ImportExcel

# Get the WMI objects for installed applications
$installedApplications = Get-WmiObject -Class Win32_Product | Select-Object Name, Version

# Create an array to store application data
$excelData = @()

# Populate the data array
foreach ($app in $installedApplications) {
    $excelData += [PSCustomObject]@{
        'Application Name' = $app.Name
        'Version'          = $app.Version
    }
}

# Define the path and file name for the Excel file
$excelFilePath = "C:\temp\PC_App_List.xlsx"

# Export data to Excel with minimal formatting
$excelData | Export-Excel -Path $excelFilePath -AutoSize -AutoFilter -TableName "InstalledApplications"

# Provide a confirmation message
Write-Host "Excel data saved to: $excelFilePath"
