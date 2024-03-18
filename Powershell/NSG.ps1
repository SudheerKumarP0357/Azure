$resourceGroupName="powershell-RG"
$location="eastus"
$NSGName="Powershell-NSG"


# RDP rule to allow RDP connection
$RuleRDP = New-AzNetworkSecurityRuleConfig `
                -Name "RDP-Rule"`
                -Description "Allow RDP Connection"`
                -Access Allow `
                -Direction Inbound `
                -Protocol Tcp `
                -Priority 110 `
                -SourceAddressPrefix  Internet `
                -SourcePortRange * `
                -DestinationAddressPrefix * `
                -DestinationPortRange 3389

# HTTP rule to allow inbound traffic for port 80
$RuleHTTP = New-AzNetworkSecurityRuleConfig `
                -Name "HTTP-Rule"`
                -Description "Allow HTTP"`
                -Access Allow `
                -Direction Inbound `
                -Protocol Tcp `
                -Priority 111 `
                -SourceAddressPrefix * `
                -SourcePortRange * `
                -DestinationAddressPrefix * `
                -DestinationPortRange 80 `


# Creating NSG with above two rules
 $NSG = New-AzNetworkSecurityGroup `
            -Name $NSGName `
            -ResourceGroupName $resourceGroupName `
            -Location $location `
            -SecurityRules $RuleRDP, $RuleHTTP