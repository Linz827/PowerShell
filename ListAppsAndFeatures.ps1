Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

Get-AppxPackage | Select-Object Name | Sort-Object Name
