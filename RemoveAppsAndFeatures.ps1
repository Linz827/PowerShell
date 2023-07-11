# Define the list of app and features you want to remove
$appsToRemove = @(
    "Microsoft.MixedReality.Portal"
    "Microsoft.SkypeApp"
    "Microsoft.ZuneMusic"
    "Microsoft.BingWeather"
    "Microsoft.MicrosoftSolitaireCollection"
    "Microsoft.Xbox.TCIU"
    "Microsoft.XboxApp"                          
    "Microsoft.XboxGameCallableUI"               
    "Microsoft.XboxGameOverlay"                  
    "Microsoft.XboxGamingOverlay"                
    "Microsoft.XboxIdentityProvider" 
    "Microsoft.XboxSpeechToTextOverlay"
    "Microsoft.ZuneVideo"
    "AD2F1837.HPPCHardwareDiagnosticsWindows"    
    "AD2F1837.HPPowerManager"                   
    "AD2F1837.HPPrivacySettings"                 
    "AD2F1837.HPQuickDrop"                       
    "AD2F1837.HPSupportAssistant"                
    "AD2F1837.HPSystemInformation"               
    "AD2F1837.myHP"
)

# Remove Windows apps
foreach ($app in $appsToRemove) {
    Write-Host "Removing app: $app"
    Get-AppxPackage -Name $app | Remove-AppxPackage -ErrorAction SilentlyContinue
}

# Define the list of features you want to remove
$featuresToRemove = @(
 )

# Remove Windows features
 foreach ($feature in $featuresToRemove) {
    Write-Host "Removing feature: $feature"
    Disable-WindowsOptionalFeature -FeatureName $featuresToRemove -Online
}
