#Requires -Module Az
#Requires -Version 7
function Connect-AzMoz {
    [CmdletBinding()]
    param (
        [String]
        [ValidateSet(
            "FXCI Azure DevTest Subscription",
            "Firefox Non-CI DevTest Subscription"
        )]
        $Subscription
    )
    
    begin {
        Connect-AzAccount -Subscription $Subscription
    }
    
    process {
        
    }
    
    end {
        
    }
}