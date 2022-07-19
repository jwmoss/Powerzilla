function Get-TCRelease {
    [CmdletBinding()]
    param (

    )

    Get-GitHubRelease -OwnerName TaskCluster -RepositoryName TaskCluster

}