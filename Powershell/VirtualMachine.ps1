$resourceGroupName="powershell-RG"
$location = "eastus"

# General Setup
$VmName = "PowerShellVm";
$VmSize = "Standard_DS1_v2";
$securityTypeStnd="Standard";
$computerName="windowsVM";

# Credential, Input Username and Password values
$user="sudheer";
$securePassword ="Password@0357" | ConvertTo-SecureString -AsPlainText -Force;
$credential = New-Object System.Management.Automation.PSCredential($user,$securePassword);

# Creating a VMConfig
$vmconfig= New-AzVMConfig `
            -VMName $VmName `
            -VMSize $VmSize `
            -SecurityType $securityTypeStnd

# Set Source Image values
$publisherName = "MicrosoftWindowsServer";
$offer = "WindowsServer";
$sku = "2022-DataCenter";
$version = "latest";
$vmconfig = Set-AzVMSourceImage `
                -VM $vmconfig `
                -PublisherName $publisherName `
                -Offer $offer `
                -Skus $sku `
                -Version $version;

# NRP Setup
$networkInterfaceName="PowerShell-NIC"
$networkName="powershell-network"

#Network Interface card ID
$networkInterface = Get-AzNetworkInterface -Name $networkInterfaceName -ResourceGroupName $resourceGroupName
$nicId=$networkInterface.Id;

#Vnet and subnet
$VirtualNetwork = Get-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroupName
$subnetId=$VirtualNetwork.Subnets[0].Id

# public IP Address
$publicIPName="PowershellPublicIp"
$publicIP= Get-AzPublicIpAddress -Name $publicIPName -ResourceGroupName $resourceGroupName;
$publicIPId=$publicIP.Id;


$vmconfig = Add-AzVMNetworkInterface -VM $vmconfig -Id $nicId;
$vmconfig = Set-AzVMOperatingSystem -VM $vmconfig -Windows -ComputerName $computerName -Credential $credential

#create a vm

New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vmconfig
$vm = Get-AzVM -ResourceGroupName $resourceGroupName -Name $VmName;