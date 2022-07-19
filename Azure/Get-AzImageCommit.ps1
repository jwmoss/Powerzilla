#Requires -Module Az,UGit
#Requires -Version 7

function Get-AzImageCommit {
    [CmdletBinding()]
    param (
        [String]
        $PathToRepo = "C:\Users\Jonathan Moss\Github_Mozilla\ronin_puppet"
    )

    begin {

    }

    process {
        Set-Location -Path $PathToRepo

        ## Get all of the images
        $Images = Show-AzMozImageTag

        ## Get the commit hash
        Import-Module ugit -Force
        $GitLog = git log

        Foreach ($i in $Images) {
            ## grab the commit hash on the image
            $i_deployment_id = ($i.name -split "-")[-1]
            ## link that to the commit has
            $link = $GitLog |
            Where-Object {
                $_.CommitHash -like "$i_deployment_id*"
            }
            if ($null -ne $link) {
                [PSCustomObject]@{
                    Name          = $i.Name
                    CommitHash    = $link.CommitHash
                    GitUserEmail  = $link.GitUserEmail
                    CommitDate    = $link.CommitDate
                    CommitMessage = $link.CommitMessage
                }
            }

        }
    }

    end {

    }
}