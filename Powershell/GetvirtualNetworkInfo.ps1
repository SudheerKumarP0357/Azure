$resourceGroupName="powershell-RG"
$networkName="powershell-network"

$VirtualNetwork=Get-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroupName

# Write-Host is used to log the output into the terminal
Write-Host $VirtualNetwork.AddressSpace.AddressPrefixes
Write-Host $VirtualNetwork.Location
