function New-AzMozDevVM {
    [CmdletBinding()]
    param (

    )

    begin {

    }

    process {
        New-AzVm `
        -ResourceGroupName 'rg-packer-through-cib' `
        -Name 'rg-packer-through-cib-vnet/default' `
        -Location 'Central US' `
        -VirtualNetworkName 'rg-packer-through-cib-vnet' `
        -SubnetName 'default' `
        -SecurityGroupName 'myNetworkSecurityGroup' `
        -PublicIpAddressName 'myPublicIpAddress' `
        -OpenPorts 3389
    }

    end {

    }
}