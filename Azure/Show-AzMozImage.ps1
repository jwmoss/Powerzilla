function Show-AzMozImageTag {
    [CmdletBinding()]
    param (

    )

    begin {

    }

    process {
        Get-AzImage | ForEach-Object {
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