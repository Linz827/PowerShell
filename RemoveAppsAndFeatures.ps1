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