function Show-AzMozImageTag {
    [CmdletBinding()]
    param (
        [Switch]
        $PackerOnly
    )

    begin {
        if ($PackerOnly) {
            $splat = @{
                ResourceGroupName = "rg-packer-through-cib"
            }
        }
    }

    process {
        Get-AzImage @splat | ForEach-Object {
            $tags = $_.Tags.GetEnumerator()
            $rg = $_.ResourceGroupName
            $name = $_.Name
            Foreach ($t in $tags) {
                [PSCustomObject]@{
                    ResourceGroupName = $rg
                    Key               = $t.Key
                    Value             = $t.Value
                    Name              = $name
                }
            }
        }
    }

    end {

    }
}