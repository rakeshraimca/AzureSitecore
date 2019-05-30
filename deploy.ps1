$SCSDK="C:\sitecore911\tools"
$SCTemplates="https://raw.githubusercontent.com/rakeshraimca/AzureSitecore/master"
$DeploymentId = "leo-dev"
$ResourceGroup = "euw-asev2-dev-rg"
$LicenseFile = "C:\sitecore911\license.xml"
$CertificateFile = "C:\sitecore911\94C76BCD3E9F2F56EEE09B9E14FA551F1E4002A4.pfx"
$SubscriptionId = "f7ae3eeb-3ca0-42a2-b9e2-34c2480a9c1b"
$Location="West Europe"
$ParamFile="C:\sitecore911\azuredeploy.parameters.json"
$Parameters = @{
"deploymentId"=$DeploymentId;
"authCertificateBlob" = [System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes($CertificateFile))
}
Import-Module $SCSDK\Sitecore.Cloud.Cmdlets.psm1
Add-AzureRMAccount
Set-AzureRMContext -SubscriptionId $SubscriptionId
Start-SitecoreAzureDeployment -Name $ResourceGroup -Location $Location -ArmTemplateUrl "$SCTemplates/azuredeploy.json" -ArmParametersPath $ParamFile -LicenseXmlPath $LicenseFile -SetKeyValue $Parameters -Verbose