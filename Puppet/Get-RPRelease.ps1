function Get-TCRelease {
    [CmdletBinding()]
    param (

    )

    Get-GitHubRelease -OwnerName 'mozilla-platform-ops' -RepositoryName 'ronin_puppet'

}