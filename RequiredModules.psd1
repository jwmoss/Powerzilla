@{
    # Set up a mini virtual environment...
    PSDependOptions             = @{
        AddToPath  = $true
        Target     = 'Output\RequiredModules'
        Parameters = @{
            Repository = 'PSGallery'
        }
    }

    'powershell-yaml'           = 'latest'
    PSScriptAnalyzer            = 'latest'
    Pester                      = 'latest'
    Az                          = 'latest'
}
