$Suffix = "contoso.com"
$expirydt = Get-Date
$expirydt = $expirydt.AddYears(10)
$password = ConvertTo-SecureString -String 'P@$$w0rd' -Force -AsPlainText
$rootCertName = "CONTOSO-INTERNAL-SitecoreRootCert"

$sites = @("solr-$Suffix",
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
           "cd-$Suffix"
           )

$rootcertprint = (Get-ChildItem -Path Cert:\LocalMachine\my\ | Where-Object {$_.Subject -contains "CN=$rootCertName, O=CONTOSO_INTERNAL, C=US"}).Thumbprint
if(!$rootcertprint){
    Write-Output "Creating New Root Cert"
    New-SelfSignedCertificate -certstorelocation cert:\localmachine\my -subject "CN=$rootCertName, O=CONTOSO_INTERNAL, C=US" -dnsname $rootCertName -NotAfter $expirydt -KeyUsage CertSign
    $rootcertprint = (Get-ChildItem -Path Cert:\LocalMachine\my\ | Where-Object {$_.Subject -contains "CN=$rootCertName, O=CONTOSO_INTERNAL, C=US"}).Thumbprint
    Export-PfxCertificate -Cert cert:\localMachine\my\$rootcertprint -FilePath $PSScriptRoot\certs\SitecoreRootCert.pfx -Password $password
    Export-Certificate -Cert cert:\localMachine\my\$rootcertprint -FilePath $PSScriptRoot\certs\SitecoreRootCert.crt
}

#Cert Generate	
function GenerateCert($xcertname){
    $rootcert = (Get-ChildItem -Path cert:\localMachine\my\$rootcertprint)
    $xcert = (Get-ChildItem -Path Cert:\LocalMachine\my\ | Where-Object {$_.Subject -contains "CN=$xcertname, O=CONTOSO_INTERNAL, C=US"}).Thumbprint
    if(!$xcert){
        Write-Output "Creating $xcertname Cert"
        New-SelfSignedCertificate -certstorelocation cert:\localmachine\my -subject "CN=$xcertname, O=CONTOSO_INTERNAL, C=US" -dnsname $xcertname -Signer $rootcert -NotAfter $expirydt
        $xcert = (Get-ChildItem -Path Cert:\LocalMachine\my\ | Where-Object {$_.Subject -contains "CN=$xcertname, O=CONTOSO_INTERNAL, C=US"}).Thumbprint
        Export-PfxCertificate -cert cert:\localMachine\my\$xcert  -FilePath $PSScriptRoot\certs\$xcertname.pfx -Password $password
        Export-Certificate -Cert cert:\localMachine\my\$xcert -FilePath $PSScriptRoot\certs\$xcertname.crt
    }
}

#Generate Certs for all sites
$sites | ForEach-Object{
    GenerateCert($_);
}