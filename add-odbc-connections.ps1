Add-OdbcDsn -Name ldms7read -DriverName "SQL Server" -DsnType User -Platform 32-bit -SetPropertyValue @("Server=GBCSQL5.cis.fb.net.nz","Trusted_Connection=Yes", "Database=GBCLDMS7")

Add-OdbcDsn -Name ldms7write -DriverName "SQL Server" -DsnType User -Platform 32-bit -SetPropertyValue @("Server=GBCSQL5.cis.fb.net.nz", "Trusted_Connection=Yes", "Database=GBCLDMS7")