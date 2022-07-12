#Requires -Module Az
#Requires -Version 7
function Get-AzMozImage {
    [CmdletBinding()]
    param (
        [String]
        [ValidateSet(
            "MicrosoftWindowsDesktop",
            "MicrosoftWindowsServer"
        )]
        $PublisherName = "MicrosoftWindowsDesktop",

        [String]
        $Location = "East US 2"
    )

    $Publisher = Get-AzVMImagePublisher -Location $Location |
    Where-Object {
        $PSItem.PublisherName -in $PublisherName
    }

    Get-AzVMImageOffer -Location $Location -PublisherName $Publisher.PublisherName

}