$resourceGroupName="powershell-RG"
$location="eastus"
$publicIPName="PowershellPublicIp"

$publicIP = New-AzPublicIpAddress `
                -Name $publicIPName `
                -ResourceGroupName $resourceGroupName `
                -Location $location `
                -AllocationMethod Static `
                -Sku Basic

Write-Host $publicIP.IpAddress
