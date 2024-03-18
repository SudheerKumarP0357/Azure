# Creating Virtual Network along with subnet
$resourceGroupName="powershell-RG"
$location="eastus"
$networkName="powershell-network"
$subnetName="powershell-subnet"
$networkInterface="PowerShell-NIC"

$VirtualNetwork = Get-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroupName

$Subnet = Get-AzVirtualNetworkSubnetConfig -Name $subnetName -VirtualNetwork $VirtualNetwork

$Nic=New-AzNetworkInterface `
    -Name $networkInterface `
    -ResourceGroupName $resourceGroupName `
    -Location $location `
    -SubnetId $Subnet.Id `
    -IpConfigurationName "IPConfig"


