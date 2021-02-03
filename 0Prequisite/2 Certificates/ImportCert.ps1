$Suffix = "contoso.com"
$rootCertName = "CONTOSO-INTERNAL-SitecoreRootCert"
$password = ConvertTo-SecureString -String 'P@$$w0rd' -Force -AsPlainText
$sites = @("SitecoreRootCert",
           "solr-$Suffix",
           "identity-$Suffix",
           "processing-$Suffix", 
           "reporting-$Suffix",
           "collection-$Suffix",
           "collectionsearch-$Suffix",
           "cortexprocessing-$Suffix",
           "cortexreporting-$Suffix",
           "marketingautomationreporting-$Suffix", 
           "marketingautomation-$Suffix",
           "referencedata-$Suffix",
           "xconnectclient-$suffix",
           "ca-$Suffix",
           "cd-$Suffix")


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
