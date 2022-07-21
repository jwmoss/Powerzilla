Function RunPester {
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $Test
    )
    $Container = New-PesterContainer -Path $test
    $config = New-PesterConfiguration
    $config.Run.Container = $Container
    $config.TestResult.Enabled = $true
    $config.Output.Verbosity = "Detailed"
    Invoke-Pester -Configuration $config
}