## Connect to Azure
Connect-AzAccount

## List only images with MicrosoftWindowsDesktop provider
Get-AzMozImage -PublisherName MicrosoftWindowsDesktop -Location "East US 2"

## Loop through each offer and get the skus
$windows_skus = @(
    "Windows-10",
    "windows-11",
    "windows-7",
    "windows11preview",
    "windows11preview-arm64"
) | ForEach-Object {
    Get-AzMozSku -Location "East US 2" -PublisherName MicrosoftWindowsDesktop -Offer $_ |
    Select-Object -Property "Skus","Offer","PublisherName"
} |
Sort-Object -Property "Skus"

$windows_skus | ForEach-Object {
    $splat = @{
        Location = "East US 2"
        PublisherName = "MicrosoftWindowsDesktop"
        Offer = $_.Offer
        Skus = $_.Skus
    }
    Get-AzVMImage @splat
}

