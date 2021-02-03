. ..\global.ps1

$Role = "cortexprocessing"
$SiteName = "$Role-$Suffix"
$Path = "$PSScriptRoot\config\xconnect-xp1-$Role.json"
$Package = "$PSScriptRoot\resources\$version (OnPrem)_xp1$Role.scwdp.zip"

$CortexProcessingParams = @{ 
    Path = $Path       
    Package = $Package     
    LicenseFile = $LicenseFile
    SiteName = $SiteName
    SSLCert = $SiteName
    XConnectCert = $XConnectCert
    SqlDbPrefix = $SqlDbPrefix  
    SqlAdminUser = $SqlAdminUser
    SqlAdminPassword = $SqlAdminPassword
    SqlMessagingUser = $SqlMessagingUser
    SqlMessagingPassword = $SqlMessagingPassword
    SqlProcessingEngineUser = $SqlProcessingEngineUser
    SqlProcessingEnginePassword = $SqlProcessingEnginePassword
    SqlReportingUser = $SqlReportingUser
    SqlReportingPassword = $SqlReportingPassword
    SqlServer = $SqlServer 
    XConnectCollectionService= $XConnectCollectionService
    XConnectSearchService= $XConnectCollectionSearchService
    XConnectEnvironment = $XConnectEnvironment
    XConnectLogLevel = $XConnectLogLevel    
    HostMappingName = $SiteName 
    DnsName = $SiteName     
} 

Write-Host ($CortexProcessingParams | Format-Table | Out-String)
Install-SitecoreConfiguration @CortexProcessingParams