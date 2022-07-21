BeforeDiscovery {
    $lookup = @{}
    $software = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |
    Get-ItemProperty |
    Where-Object {
        $PSItem.DisplayName -ne "Microsoft FSLogix Apps" -and $PSItem.DisplayName -ne $null
    }
    $software | ForEach-Object {
        $lookup.Add($_.DisplayName, $_)
    }
}

Describe "Python" -Tag "Python" {
    It "<_.DisplayName> is installed" -ForEach @(
        $Software | Where-object { $PSItem.DisplayName -match "Python" }
    ) {
        $lookup[$_.DisplayName].DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 3.9.5" -ForEach @(
        $Software | Where-object { $PSItem.DisplayName -match "Python" }
    ) {
        $lookup[$_.DisplayName].DisplayVersion | Should -Be "3.9.5150.0"
    }
}

Describe "Mercurial" -Tag "Mercurial" {
    BeforeAll {
        $Application = $Software | Where-object { $PSItem.DisplayName -match "Mercurial" }
    }

    It "Mercurial is installed" {
        $lookup[$Application.DisplayName] | Should -Not -Be $null
    }

    It "Mercurial Version is 5.9.3" {
        $lookup[$Application.DisplayName].DisplayVersion | Should -Be "5.9.3"
    }
}

Describe "Git" -Tag "Git" {
    BeforeAll {
        $Application = $Software | Where-object { $PSItem.DisplayName -match "Git" }
    }

    It "Mercurial is installed" {
        $lookup[$Application.DisplayName] | Should -Not -Be $null
    }

    It "Mercurial Version is 2.37.1" {
        $lookup[$Application.DisplayName].DisplayVersion | Should -Be "2.37.1"
    }
}