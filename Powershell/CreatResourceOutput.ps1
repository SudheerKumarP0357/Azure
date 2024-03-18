$resourceGroupName="powershell-RG"
$location="eastus"
$networkName="powershell-network"
$addressPrefix="10.0.0.0/16"

# Remove the existing Virtual network
# Remove-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroupName

$VirtualNetwork=New-AzVirtualNetwork `
                    -Name $networkName `
                    -ResourceGroupName $resourceGroupName `
                    -Location $location `
                    -AddressPrefix $addressPrefix


Write-Host $VirtualNetwork.AddressSpace.AddressPrefixes
Write-Host $VirtualNetwork.Location