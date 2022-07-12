#Requires -Module Az
#Requires -Version 7
function Get-AzMozSku {
    [CmdletBinding()]
    param (
        [String]
        $Location = "East US 2",

        [String]
        [ValidateSet(
            "MicrosoftWindowsDesktop",
            "MicrosoftWindowsServer"
        )]
        $PublisherName = "MicrosoftWindowsDesktop",

        [String]
        [ValidateSet(
            "office-365",
            "test_sj_win_client",
            "Windows-10",
            "windows-10-1607-vhd-client-prod-stage",
            "windows-10-1803-vhd-client-prod-stage",
            "windows-10-1809-vhd-client-office-prod-stage",
            "windows-10-1809-vhd-client-prod-stage",
            "windows-10-1903-vhd-client-office-prod-stage",
            "windows-10-1903-vhd-client-prod-stage",
            "windows-10-1909-vhd-client-office-prod-stage",
            "windows-10-1909-vhd-client-prod-stage",
            "windows-10-2004-vhd-client-office-prod-stage",
            "windows-10-2004-vhd-client-prod-stage",
            "windows-10-20h2-vhd-client-office-prod-stage",
            "windows-10-20h2-vhd-client-prod-stage",
            "windows-10-ppe",
            "windows-11",
            "windows-7",
            "windows-7-0-sp1-vhd-client-prod-stage",
            "windows-ent-cpc",
            "windows-evd",
            "windows10preview",
            "windows11preview",
            "windows11preview-arm64",
            "19h1gen2servertest",
            "microsoftserveroperatingsystems-previews",
            "servertesting",
            "windows-10-1607-vhd-server-prod-stage",
            "windows-10-1607-vhd-sf-server-prod-stage",
            "windows-10-1803-vhd-server-prod-stage",
            "windows-10-1809-vhd-server-prod-stage",
            "windows-10-1809-vhd-sf-server-prod-stage",
            "windows-10-1903-vhd-server-prod-stage",
            "windows-10-1909-vhd-server-prod-stage",
            "windows-10-2004-vhd-server-prod-stage",
            "windows-10-20h2-vhd-server-prod-stage",
            "windows-7-0-sp1-vhd-server-prod-stage",
            "windows-8-0-vhd-server-prod-stage",
            "windows-8-1-vhd-server-prod-stage",
            "windows-cvm",
            "windows-server-2012-vhd-server-prod-stage",
            "WindowsServer",
            "windowsserver-gen2preview",
            "windowsserver-previewtest",
            "windowsserverdotnet",
            "WindowsServerSemiAnnual"
        )]
        $Offer
    )

    Get-AzVMImageSku -Location $Location -PublisherName $PublisherName -Offer $Offer

}