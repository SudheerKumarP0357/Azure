# Creating Virtual Network along with subnet
$resourceGroupName="powershell-RG"
$location="eastus"
$networkName="powershell-network"
$vnetAddressPrefix="10.0.0.0/16"
$subnetName="powershell-subnet"
$subnetAddressPrefix="10.0.1.0/24"

# If we are creating Vnet along with Subnet, we have you create a subnet variable with below command 
# and assign the subnet varible in the vnet create cmd
$subnet= New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix $subnetAddressPrefix

# Create a  Vnet along with subnet
New-AzVirtualNetwork `
    -Name $networkName `
    -ResourceGroupName $resourceGroupName `
    -Location $location `
    -AddressPrefix $vnetAddressPrefix `
    -Subnet $subnet


