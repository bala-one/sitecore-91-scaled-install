$Suffix = "contoso.local"
$rootCertName = "CONTOSO-INTERNAL-SitecoreRootCert"
$password = ConvertTo-SecureString -String 'P@$$w0rd' -Force -AsPlainText
$sites = @("solr-$Suffix",
           "$Suffix",
           "xconnect-$suffix"
           )


#Generate Certs for all sites
$sites | ForEach-Object{
    if($_ -eq "SitecoreRootCert"){
        Import-Certificate -FilePath "$PSScriptRoot\certs\$_.Crt" -CertStoreLocation 'Cert:\LocalMachine\Root'
    }
    else{
        Import-PfxCertificate -FilePath "$PSScriptRoot\certs\$_.pfx" -CertStoreLocation 'Cert:\LocalMachine\My' -Password $password -Verbose
        #Import-Certificate -FilePath "$PSScriptRoot\certs\$_.Crt" -CertStoreLocation 'Cert:\LocalMachine\My'
    }
}
