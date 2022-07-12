#Requires -Module 'powershell-yaml'

function Get-MozPackerConfig {
    [CmdletBinding()]
    param (
        [ValidateScript({
                if ( -Not ($_ | Test-Path) ) {
                    throw "File or folder does not exist"
                }
                return $true
            })]
        [System.IO.FileInfo]
        $ConfigFile
    )
    
    begin {
        
    }
    
    process {
       Get-Content $ConfigFile -Raw | ConvertFrom-Yaml
    }
    
    end {
        
    }
}