Import-Module SitecoreFundamentals

Import-Module SitecoreInstallFramework -RequiredVersion 2.0.0

#define parameters 
$Prefix = "Contoso_" 
$Path = "$PSScriptRoot\sitecore-solr.json"

$SolrUrl = "https://solr-contoso.com:8983/solr" 
$SolrRoot = "e:\solr\solr-7.2.1" 
$SolrService = "solr721" 
$CorePrefix = $Prefix
  
#Configure Sitecore Solr Cores
$SolrCoresParams = @{     
    Path = $Path     
    SolrUrl = $SolrUrl     
    SolrRoot = $SolrRoot     
    SolrService = $SolrService     
    CorePrefix = $CorePrefix 
} 
Write-Host @SolrCoresParams
Install-SitecoreConfiguration @SolrCoresParams -Verbose



$xConnectPath = "$PSScriptRoot\xconnect-solr.json"
#Configure Sitecore Solr Cores for xConnect
$SolrCoresParams = @{     
    Path = $xConnectPath     
    SolrUrl = $SolrUrl     
    SolrRoot = $SolrRoot     
    SolrService = $SolrService     
    CorePrefix = $CorePrefix 
} 
Write-Host @SolrCoresParams
Install-SitecoreConfiguration @SolrCoresParams -Verbose