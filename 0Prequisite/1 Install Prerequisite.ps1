# * Make sure you run this script from a Powershel Admin Prompt!
# * Make sure Powershell Execution Policy is bypassed to run these scripts:
# * YOU MAY HAVE TO RUN THIS COMMAND PRIOR TO RUNNING THIS SCRIPT!

#SIF Install

Register-PSRepository -Name SitecoreGallery -SourceLocation https://sitecore.myget.org/F/sc-powershell/api/v2 -InstallationPolicy Trusted
Install-Module -Name SitecoreFundamentals -Repository SitecoreGallery
Install-Module -Name SitecoreInstallFramework -Repository SitecoreGallery -RequiredVersion 2.1.0
Update-Module SitecoreInstallFramework

Install-SitecoreConfiguration -Path .\Prerequisites.json