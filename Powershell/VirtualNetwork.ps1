$resourceGroupName="powershell-RG"
$location="eastus"
$networkName="powershell-network"
$addressPrefix="10.0.0.0/16"


New-AzVirtualNetwork `
    -Name $networkName `
    -ResourceGroupName $resourceGroupName `
    -Location $location `
    -AddressPrefix $addressPrefix