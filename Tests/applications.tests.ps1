BeforeDiscovery {
    . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    $lookup = @{}
    $software = Get-InstalledSoftware | Where-Object {
        $PSItem.DisplayName -ne $null -and $PSItem.DisplayName -notmatch "FSLogix"
    }
    $software | ForEach-Object {
        $lookup.Add($_.DisplayName, $_)
    }
}

Describe "7-Zip" -Tag "7-Zip" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
        $lookup = @{}
        $software = Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -ne $null -and $PSItem.DisplayName -notmatch "FSLogix"
        }
        $software | ForEach-Object {
            $lookup.Add($_.DisplayName, $_)
        }
        $Application = $Software | Where-object { $PSItem.DisplayName -match "Zip" }
    }

    It "7-Zip is installed" {
        $lookup[$Application.DisplayName] | Should -Not -Be $null
    }

    It "7-Zip Version is 18.06.00.0" {
        $lookup[$Application.DisplayName].DisplayVersion | Should -Be "18.06.00.0"
    }
}

Describe "Application Verifier" -Tag "Drivers" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
        $lookup = @{}
        $software = Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -ne $null -and $PSItem.DisplayName -notmatch "FSLogix"
        }
        $software | ForEach-Object {
            $lookup.Add($_.DisplayName, $_)
        }
        $Application = $Software | Where-object { $PSItem.DisplayName -match "Application Verifier" }
    }

    It "Application Verifier is installed" {
        $lookup[$Application.DisplayName] | Should -Not -Be $null
    }

    It "Application Verifier is 10.1.19041.685" {
        $lookup[$Application.DisplayName].DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Git" -Tag "Git" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
        $lookup = @{}
        $software = Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -ne $null -and $PSItem.DisplayName -notmatch "FSLogix"
        }
        $software | ForEach-Object {
            $lookup.Add($_.DisplayName, $_)
        }
        $Application = $Software | Where-object { $PSItem.DisplayName -match "Git" }
    }

    It "Git is installed" {
        $lookup[$Application.DisplayName] | Should -Not -Be $null
    }

    It "Git Version is 2.37.1" {
        $lookup[$Application.DisplayName].DisplayVersion | Should -Be "2.37.1"
    }
}

Describe "GPG4Win" -Tag "GPG4Win" -Skip {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
        $lookup = @{}
        $software = Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -ne $null -and $PSItem.DisplayName -notmatch "FSLogix"
        }
        $software | ForEach-Object {
            $lookup.Add($_.DisplayName, $_)
        }
        $Application = $Software | Where-Object { $PSItem.DisplayName -eq "Gpg4win (2.3.0)" }
    }

    It "GPG4Win is installed" {
        $lookup[$Application.DisplayName] | Should -Not -Be $null
    }

    It "GPG4Win Version is 2.3.0" {
        $lookup[$Application.DisplayName].DisplayVersion | Should -Be "2.3.0"
    }
}

Describe "Kits Configuration Installer" -Tag "Drivers" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
        $lookup = @{}
        $software = Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -ne $null -and $PSItem.DisplayName -notmatch "FSLogix"
        }
        $software | ForEach-Object {
            $lookup.Add($_.DisplayName, $_)
        }
        $Application = $Software | Where-Object { $PSItem.DisplayName -eq "Kits Configuration Installer" }
    }

    It "Kits Configuration Installer is installed" {
        $lookup[$Application.DisplayName] | Should -Not -Be $null
    }

    It "Kits Configuration Installer Version is 10.1.19041.685" {
        $lookup[$Application.DisplayName].DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Microsoft .NET Framework 4.8 SDK" -Tag ".Net","Microsoft" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft .NET Framework 4.8*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 4.8.04084" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft .NET Framework 4.8*"
        }
    ) {
        $_.DisplayVersion | Should -Be "4.8.04084"
    }
}

Describe "Microsoft Visual C++ 2015-2019" -Tag "Microsoft" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft Visual C++ 2015-2019*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 14.29.30139.0" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft Visual C++ 2015-2019*"
        }
    ) {
        $_.DisplayVersion | Should -Be "14.29.30139.0"
    }
}

Describe "Microsoft Visual C++ 2019" -Tag "Microsoft" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft Visual C++ 2019*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 14.29.30139" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft Visual C++ 2019*"
        }
    ) {
        $_.DisplayVersion | Should -Be "14.29.30139"
    }
}

Describe "Microsoft Visual Studio Installer" -Tag "Microsoft" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft Visual Studio Installer*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 2.11.69.53063" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft Visual Studio Installer*"
        }
    ) {
        $_.DisplayVersion | Should -Be "2.11.69.53063"
    }
}

Describe "Microsoft Visual Studio Setup" -Tag "Microsoft" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft Visual Studio Setup*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 2.11.65.22356" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Microsoft Visual Studio Setup*"
        }
    ) {
        $_.DisplayVersion | Should -Be "2.11.65.22356"
    }
}

Describe "Mozilla Maintenance Service" -Tag "Mozilla" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Mozilla Maintenance Service*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 27.0a1" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Mozilla Maintenance Service*"
        }
    ) {
        $_.DisplayVersion | Should -Be "27.0a1"
    }
}

Describe "MSI Development Tools" -Tag "" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "MSI Development Tools*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "MSI Development Tools*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Puppet Agent (64-bit)" -Tag "" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Puppet Agent (64-bit)*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 6.0.0" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Puppet Agent (64-bit)*"
        }
    ) {
        $_.DisplayVersion | Should -Be "6.0.0"
    }
}

Describe "NXLog-CE" -Tag "" {

    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "NXLog-CE*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 2.10.2150" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "NXLog-CE*"
        }
    ) {
        $_.DisplayVersion | Should -Be "2.10.2150"
    }
}

Describe "Python" -Tag "Python" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Python 3*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 3.9.5150.0" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Python 3*"
        }
    ) {
        $_.DisplayVersion | Should -Be "3.9.5150.0"
    }
}

Describe "SDK" -Tag "" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "SDK*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "SDK*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Sublime Text" -Tag "" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Sublime Text*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
}

Describe "Universal CRT" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Universal CRT*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Universal CRT*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Universal General MIDI DLS Extension SDK" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Universal General MIDI DLS Extension SDK*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Universal General MIDI DLS Extension SDK*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Virtual Audio Cable" -Tag "" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Virtual Audio Cable*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 4.64" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Virtual Audio Cable*"
        }
    ) {
        $_.DisplayVersion | Should -Be "4.64"
    }
}

Describe "Visual Studio Build Tools 2019" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Visual Studio Build Tools 2019*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 16.11.17" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Visual Studio Build Tools 2019*"
        }
    ) {
        $_.DisplayVersion | Should -Be "16.11.17"
    }
}

Describe "vs_FileTracker_Singleton" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "vs_FileTracker_Singleton*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 16.10.31303" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "vs_FileTracker_Singleton*"
        }
    ) {
        $_.DisplayVersion | Should -Be "16.10.31303"
    }
}

Describe "WinAppDeploy" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "WinAppDeploy*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "WinAppDeploy*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows App Certification" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows App Certification*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows App Certification*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows Azure VM Agent" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Azure VM Agent*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 2.7.41491.949" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Azure VM Agent*"
        }
    ) {
        $_.DisplayVersion | Should -Be "2.7.41491.949"
    }
}

Describe "Windows Desktop Extension" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Desktop Extension*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Desktop Extension*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows IoT Extension" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows IoT Extension*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows IoT Extension*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows IP Over USB" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows IP Over USB*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows IP Over USB*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows Mobile Extension" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Mobile Extension*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Mobile Extension*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -eq "Windows SDK"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -eq "Windows SDK"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK AddOn" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -eq "Windows SDK AddOn"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.0.0" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -eq "Windows SDK AddOn"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.0.0"
    }
}

Describe "Windows SDK ARM Desktop Tools" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -eq "Windows SDK ARM Desktop Tools"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -eq "Windows SDK ARM Desktop Tools"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK Desktop" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Desktop*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Desktop*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK DirectX" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK DirectX*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK DirectX*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK EULA" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK EULA*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK EULA*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK Facade Windows" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Facade Windows*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Facade Windows*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK for Windows Store" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK for Windows Store*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK for Windows Store*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK Modern" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Modern*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Modern*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK Redistributables" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Redistributables*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Redistributables*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows SDK Signing Tools" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Signing Tools*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows SDK Signing Tools*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows Software Development Kit" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Software Development Kit*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Software Development Kit*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows Team Extension SDK" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Team Extension SDK*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "Windows Team Extension SDK*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "WinRT Intellisense" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "WinRT Intellisense*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "WinRT Intellisense*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}

Describe "Windows Performance Toolkit" -Tag "Microsoft" {
    BeforeAll {
        . "C:\Users\jmoss\Documents\Get-InstalledSoftware.ps1"
    }

    It "<_.DisplayName> is installed" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "WPT*"
        }
    ) {
        $_.DisplayName | Should -Not -Be $Null
    }
    It "<_.DisplayName> is version 10.1.19041.685" -ForEach @(
        Get-InstalledSoftware | Where-Object {
            $PSItem.DisplayName -like "WPT*"
        }
    ) {
        $_.DisplayVersion | Should -Be "10.1.19041.685"
    }
}