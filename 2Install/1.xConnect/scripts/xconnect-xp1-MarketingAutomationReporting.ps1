. ..\global.ps1

$Role = "marketingautomationreporting"
$SiteName = "$Role-$Suffix"
$Path = "$PSScriptRoot\config\xconnect-xp1-$Role.json"
$Package = "$PSScriptRoot\resources\$version (OnPrem)_xp1$Role.scwdp.zip"

$CollectionParams = @{     
    Path = $Path  
    Package = $Package     
    LicenseFile = $LicenseFile
    SiteName = $SiteName
    SSLCert = $SiteName
    XConnectCert = $XConnectCert
    SqlDbPrefix = $SqlDbPrefix  
    SqlReferenceDataUser =$SqlReferenceDataUser
    SqlReferenceDataPassword =$SqlReferenceDataPassword
    SqlMarketingAutomationUser = $SqlMarketingAutomationUser
    SqlMarketingAutomationPassword = $SqlMarketingAutomationPassword
    SqlServer = $SqlServer 
    XConnectEnvironment = $XConnectEnvironment
    XConnectLogLevel = $XConnectLogLevel 
    HostMappingName = $SiteName 
    DnsName = $SiteName           
} 
Write-Host ($CollectionParams | Format-Table | Out-String)
Install-SitecoreConfiguration @CollectionParams