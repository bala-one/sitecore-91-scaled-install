. ..\global.ps1

$Role = "referencedata"
$SiteName = "$Role-$Suffix"
$Path = "$PSScriptRoot\config\xconnect-xp1-$Role.json"
$Package = "$PSScriptRoot\resources\$version (OnPrem)_xp1$Role.scwdp.zip"

$CortexReportingParams = @{ 
    Path = $Path       
    Package = $Package     
    LicenseFile = $LicenseFile
    SiteName = $SiteName
    SSLCert = $SiteName
    XConnectCert = $XConnectCert
    SqlDbPrefix = $SqlDbPrefix  
    SqlAdminUser = $SqlAdminUser
    SqlAdminPassword = $SqlAdminPassword
    SqlReferencedataUser = $SqlReferencedataUser
    SqlReferencedataPassword = $SqlReferencedataPassword
    SqlServer = $SqlServer 
    XConnectEnvironment = $XConnectEnvironment
    XConnectLogLevel = $XConnectLogLevel    
    HostMappingName = $SiteName 
    DnsName = $SiteName     
} 

Write-Host ($CortexReportingParams | Format-Table | Out-String)
Install-SitecoreConfiguration @CortexReportingParams