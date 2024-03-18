$resourceGroupName="powershell-RG"
$networkName="powershell-network"


$VirtualNetwork = Get-AzVirtualNetwork `
                    -Name $networkName `
                    -ResourceGroupName $resourceGroupName

Write-Host $VirtualNetwork | Format-Table