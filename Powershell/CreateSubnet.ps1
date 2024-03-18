$resourceGroupName="powershell-RG"
$networkName="powershell-network"
$subnetName="powershell-subnet"
$subnetAddressPrefix="10.0.1.0/24"

$VirtualNetwork = Get-AzVirtualNetwork `
                    -Name $networkName `
                    -ResourceGroupName $resourceGroupName

Add-AzVirtualNetworkSubnetConfig `
        -Name $subnetName `
        -VirtualNetwork $VirtualNetwork `
        -AddressPrefix $subnetAddressPrefix

$VirtualNetwork | Set-AzVirtualNetwork