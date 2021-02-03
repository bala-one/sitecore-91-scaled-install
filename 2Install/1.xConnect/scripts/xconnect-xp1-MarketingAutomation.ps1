. ..\global.ps1

$Role = "marketingautomation"
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
    SqlCollectionUser = $SqlCollectionUser
    SqlCollectionPassword = $SqlCollectionPassword
    SqlAdminUser = $SqlAdminUser     
    SqlAdminPassword = $SqlAdminPassword
    SqlProcessingPoolsUser = $SqlProcessingPoolsUser
    SqlProcessingPoolsPassword = $SqlProcessingPoolsPassword
    SqlReferenceDataUser =$SqlReferenceDataUser
    SqlReferenceDataPassword =$SqlReferenceDataPassword
    SqlMarketingAutomationUser = $SqlMarketingAutomationUser
    SqlMarketingAutomationPassword = $SqlMarketingAutomationPassword
    SqlMessagingUser = $SqlMessagingUser
    SqlMessagingPassword = $SqlMessagingPassword
    SqlServer = $SqlServer 
    XConnectCollectionService= $XConnectCollectionService
    XConnectReferenceDataService = $XConnectReferenceDataService
    XConnectEnvironment = $XConnectEnvironment
    XConnectLogLevel = $XConnectLogLevel 
    HostMappingName = $SiteName 
    DnsName = $SiteName           
} 

Write-Host ($CollectionParams | Format-Table | Out-String)
Install-SitecoreConfiguration @CollectionParams