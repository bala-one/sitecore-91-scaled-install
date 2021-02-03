. ..\global.ps1

$Role = "identity"
$SiteName = "$Role$Suffix"
$Path = "$PSScriptRoot\config\identityserver.json"
$Package = "$PSScriptRoot\resources\$Identityversion (OnPrem)_identityserver.scwdp.zip"
$SqlCoreDbName = "_Core"

$PasswordRecoveryUrl = "https://ca" + $Suffix
$AllowedCorsOrigins = "https://ca" + $Suffix

$IdentityParams = @{      
    Path                 = $Path
    Package              = $Package
    SqlDbPrefix          = $SqlDbPrefix
    LicenseFile          = $LicenseFile
    SitecoreIdentityCert = $SiteName
    SiteName             = $SiteName
    SqlCoreUser          = $SqlCoreUser
    SqlCoreDbName        = $SqlCoreDbName
    SqlCorePassword      = $SqlCorePassword
    SqlServer            = $SqlServer
    PasswordRecoveryUrl  = $PasswordRecoveryUrl
    AllowedCorsOrigins   = $AllowedCorsOrigins
    HostMappingName      = $SiteName 
    DnsName              = $SiteName 
} 
Write-Host ($IdentityParams | Format-Table | Out-String)
Install-SitecoreConfiguration @IdentityParams 
#*>&1 | Tee-Object identity.log