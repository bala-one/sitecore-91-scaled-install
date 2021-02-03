. ..\global.ps1

$Role = "collectionsearch"
$SiteName = "$Role-$Suffix"
$Path = "$PSScriptRoot\config\xconnect-xp1-$Role.json"
$Package = "$PSScriptRoot\resources\$version (OnPrem)_xp1$Role.scwdp.zip"

$CollectionSearchParams = @{ 
    Path = $Path       
    Package = $Package     
    LicenseFile = $LicenseFile
    SiteName = $SiteName
    SSLCert = $SiteName
    XConnectCert = $XConnectCert
    SqlDbPrefix = $SqlDbPrefix  
    SqlCollectionUser = $SqlCollectionUser
    SqlCollectionPassword = $SqlCollectionPassword
    SqlProcessingPoolsUser = $SqlProcessingPoolsUser
    SqlProcessingPoolsPassword = $SqlProcessingPoolsPassword
    SqlMarketingAutomationUser = $SqlMarketingAutomationUser
    SqlMarketingAutomationPassword = $SqlMarketingAutomationPassword
    SqlMessagingUser = $SqlMessagingUser
    SqlMessagingPassword = $SqlMessagingPassword
    SqlServer = $SqlServer 
    SolrCorePrefix = $SolrCorePrefix
    SolrUrl = $SolrUrl
    XConnectEnvironment = $XConnectEnvironment
    XConnectLogLevel = $XConnectLogLevel    
    HostMappingName = $SiteName 
    DnsName = $SiteName     
} 
Write-Host ($CollectionSearchParams | Format-Table | Out-String)
Install-SitecoreConfiguration @CollectionSearchParams