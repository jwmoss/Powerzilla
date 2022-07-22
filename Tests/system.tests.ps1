## Tags
<#
win1064
system
win10642004
#>
Describe "Disable Services" -Tag "system", "win1064" {
    Context "Windows Search" {
        BeforeAll {
            $service = "wsearch"
        }
        It "Exists as a service" {
            Get-Service $service | Should -Not -Be $null
        }
        It "Windows Search is disabled" {
            (Get-Service $service).Status | Should -Be "Stopped"
        }
    }
    Context "Puppet" {
        BeforeAll {
            $service = "puppet"
        }
        It "Exists as a service" {
            Get-Service $service | Should -Not -Be $null
        }
        It "Puppet is disabled" {
            (Get-Service $service).Status | Should -Be "Stopped"
        }
    }
    Context "Windows Update" {
        BeforeAll {
            $win_update_key = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate"
            $win_update_au_key = $win_update_key + "\AU"
            $win_au_key = "HKLM:\SOFTWARE\Microsoft\Windows\Windows\AU"
            $win_update_preview_builds = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PreviewBuilds"
            $service = "wuauserv"
        }

        It "Exists as a service" {
            Get-Service $service | Should -Not -Be $null
        }
        It "Windows Update is disabled" {
            (Get-Service $service).Status | Should -Be "Stopped"
        }
        It "Windows Update SearchOrderConfig is 0" {
            Get-ItemPropertyValue HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching -Name "SearchOrderConfig" | Should -Be 0
        }
        It "Windows Update AUOptions is 1" {
            Get-ItemPropertyValue $win_au_key -Name "AUOptions" | Should -Be 1
        }
        It "Windows Update NoAutoUpdate is 1" {
            Get-ItemPropertyValue $win_au_key -Name "NoAutoUpdate" | Should -Be 1
        }
        It "Windows Update NoAutoUpdate is 1" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_au_key -Name "NoAutoUpdate" | Should -Be 1
        }
        It "Windows Update AUOptions is 1" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_au_key -Name "AUOptions" | Should -Be 2
        }
        It "Windows Update DeferUpgrade is 1" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_key -Name "DeferUpgrade" | Should -Be 1
        }
        It "Windows Update DeferUpgradePeriod is 8" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_key -Name "DeferUpgradePeriod" | Should -Be 8
        }
        It "Windows Update DeferUpdatePeriod is 4" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_key -Name "DeferUpdatePeriod" | Should -Be 4
        }
        It "Windows Update NoAutoRebootWithLoggedOnUsers is 1" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_au_key -Name "NoAutoRebootWithLoggedOnUsers" | Should -Be 1
        }
        It "Windows Update ScheduledInstallDay is 1" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_au_key -Name "ScheduledInstallDay" | Should -Be 1
        }
        It "Windows Update ScheduledInstallTime is 1" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_au_key -Name "ScheduledInstallTime" | Should -Be 1
        }
        It "Windows Update AutomaticMaintenanceEnabled is 1" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_au_key -Name "AutomaticMaintenanceEnabled" | Should -Be 0
        }
        It "Windows Update MaintenanceDisabled is 1" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_au_key -Name "MaintenanceDisabled" | Should -Be 1
        }
        It "Windows Update Disable Insider Program" -Tag "win10642004" {
            Get-ItemPropertyValue $win_update_preview_builds -Name "AllowBuildPreview" | Should -Be 0
        }
    }
    Context "OneDrive" {
        BeforeAll {
            $OneDriveReg = "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\OneDrive"
            $OneDriveExplorer = "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6"
            $OneDriveExplorerWow6432 = "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
            $OneDriveNewUserReg = "HKEY_USERS\Default\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
            $OneDriveShortcutLink = "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"
            New-PSDrive -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" -Name "HKCR"
        }

        It "OneDrive Registry entry exists" {
            Test-Path $OneDriveReg | Should -Be $true
        }

        It "Disable OneDrive via Group Policies" {
            Get-ItemPropertyValue $OneDriveReg -Name "DisableFileSyncNGSC" -ErrorAction SilentlyContinue | Should -Be 1
        }

        It "OneDrive Folders Should Not Exist" -ForEach @(
            "$ENV:localappdata\Microsoft\OneDrive",
            "$ENV:ProgramData\Microsoft OneDrive",
            "C:\OneDriveTemp"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "OneDrive HKCR Path exists" {
            Test-Path $OneDriveExplorer | Should -Be $true
        }
        It "OneDrive IsPinnedToNameSpaceTree is 0" {
            Get-ItemPropertyValue $OneDriveExplorer -Name "System.IsPinnedToNameSpaceTree" -ErrorAction "SilentlyContinue" | Should -Be 0
        }
        It "OneDrive HKCR Wow6432 Path exists" {
            Test-Path $OneDriveExplorerWow6432 | Should -Be $true
        }
        It "OneDrive Wow64342 IsPinnedToNameSpaceTree is 0" {
            Get-ItemPropertyValue $OneDriveExplorerWow6432 -Name "System.IsPinnedToNameSpaceTree" -ErrorAction "SilentlyContinue" | Should -Be 0
        }
        It "OneDrive run option is removed for new users" {
            reg load "hku\Default" "C:\Users\Default\NTUSER.DAT"
            Get-ItemPropertyValue $OneDriveNewUserReg -Name "OneDrive" -ErrorAction "SilentlyContinue" | Should -Be $null
            reg unload "hku\Default"
        }
        It "OneDrive Startmenu Entry should not exist" {
            Test-Path $OneDriveShortcutLink | Should -Be $false
        }
        It "OneDrive leftovers are removed" {
            $OneDriveLeftOvers = Get-ChildItem "ENV:Windir\WinSxS\*onedrive*"
            $OneDriveLeftOvers | Should -Be $Null
        }
    }
    Context "Windows Defender Drivers and Process" -Tags "Security" {

        It "Check if Windows Defender is Running" -Tag "win10642004", "win1061903" {
            Get-Process "msmpgeng.exe" -ErrorAction SilentlyContinue | Should -be $null
        }
        It "Windows Defender <_.Name> is renamed" -Tag "win10642004", "win1061903" -Foreach @(
            [PSCustomObject]@{
                Name = "WdBoot.sys"
                Path = "$ENV:SystemRoot\System32\drivers\WdBoot.sys.bak"
            },
            [PSCustomObject]@{
                Name = "WdFilter.sys"
                Path = "$ENV:SystemRoot\System32\drivers\WdFilter.sys.bak"
            }
        ) {
            Test-Path $_.Path | Should -Be $true
        }
        It "Windows Defender <_.Name> doesn't exist" -Tag "win10642004", "win1061903" -ForEach @(
            [PSCustomObject]@{
                Name = "WdBoot.sys"
                Path = "$ENV:SystemRoot\System32\drivers\WdBoot.sys"
            },
            [PSCustomObject]@{
                Name = "WdFilter.sys"
                Path = "$ENV:SystemRoot\System32\drivers\WdFilter.sys"
            }
        ) {
            Test-Path $_.Path | Should -Be $false
        }
    }
    Context "Windows Defender Registry" -Tags "Security" {
        It "Disable Scan with Defender Right Click Context Menu" -ForEach @(
            "HKLM:\Software\Classes\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{09A47860-11B0-4DA5-AFA5-26D86198A780}",
            "HKLM:\Software\Classes\CLSID\{D8559EB9-20C0-410E-BEDA-7ED416AECC2A}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{D8559EB9-20C0-410E-BEDA-7ED416AECC2A}"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "Disable PSFactoryBuffer" -ForEach @(
            "HKLM:\Software\Classes\CLSID\{13F6A0B6-57AF-4BA7-ACAA-614BC89CA9D8}",
            "HKLM:\Software\Classes\CLSID\{94F35585-C5D7-4D95-BA71-A745AE76E2E2}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{13F6A0B6-57AF-4BA7-ACAA-614BC89CA9D8}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{94F35585-C5D7-4D95-BA71-A745AE76E2E2}"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "Disable DefenderCSP.dll" -ForEach @(
            "HKLM:\Software\Classes\CLSID\{195B4D07-3DE2-4744-BBF2-D90121AE785B}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{195B4D07-3DE2-4744-BBF2-D90121AE785B}"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "Disable IOfficeAntiVirus Implementation" -Skip -ForEach @(
            "HKLM:\Software\Classes\CLSID\{2781761E-28E0-4109-99FE-B9D127C57AFE}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{2781761E-28E0-4109-99FE-B9D127C57AFE}"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "Disable InfectionState WMI Provider" -ForEach @(
            "HKLM:\Software\Classes\CLSID\{361290c0-cb1b-49ae-9f3e-ba1cbe5dab35}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{361290c0-cb1b-49ae-9f3e-ba1cbe5dab35}"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "Disable Status WMI Provider" -ForEach @(
            "HKLM:\Software\Classes\CLSID\{8a696d12-576b-422e-9712-01b9dd84b446}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{8a696d12-576b-422e-9712-01b9dd84b446}"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "Disable Windows Defender MsMpComm.dll" -ForEach @(
            "HKLM:\Software\Classes\CLSID\{A2D75874-6750-4931-94C1-C99D3BC9D0C7}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{A2D75874-6750-4931-94C1-C99D3BC9D0C7}",
            "HKLM:\Software\Classes\TypeLib\{8C389764-F036-48F2-9AE2-88C260DCF43B}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{8C389764-F036-48F2-9AE2-88C260DCF43B}"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "Disable Windows Defender WMI Provider" -ForEach @(
            "HKLM:\Software\Classes\CLSID\{A7C452EF-8E9F-42EB-9F2B-245613CA0DC9}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{A7C452EF-8E9F-42EB-9F2B-245613CA0DC9}"
        ) {
            Test-Path $_ | Should -Be $false
        }
        It "Disable MP UX Host" -ForEach @(
            "HKLM:\Software\Classes\CLSID\{FDA74D11-C4A6-4577-9F73-D7CA8586E10D}",
            "HKLM:\Software\Classes\Wow6432Node\CLSID\{FDA74D11-C4A6-4577-9F73-D7CA8586E10D}"
        ) {
            Test-Path $_ | Should -Be $false
        }
    }
    Context "Windows Defender Feature Registry" -Tags "Security" {
        BeforeAll {
            $Defender = "HKLM:\Software\Microsoft\Windows Defender"
        }
        It "Disable AntiSpyware" {
            Get-ItemPropertyValue $Defender -Name "DisableAntiSpyware" | Should -Be 1
        }
        It "Disable DisableRoutinelyTakingAction" {
            Get-ItemPropertyValue $Defender -Name "DisableRoutinelyTakingAction" | Should -Be 1
        }
        It "Disable ProductStatus" {
            Get-ItemPropertyValue $Defender -Name "ProductStatus" | Should -Be 0
        }
        It "Disable DisableAntiSpywareRealtimeProtection" {
            Get-ItemPropertyValue ($Defender + "\Real-Time Protection") -Name "DisableAntiSpywareRealtimeProtection" | Should -Be 1
        }
        It "Disable DisableRealtimeMonitoring" {
            Get-ItemPropertyValue ($Defender + "\Real-Time Protection") -Name "DisableRealtimeMonitoring" | Should -Be 1
        }
        It "Disable AutomaticallyCleanAfterScan" {
            Get-ItemPropertyValue ($Defender + "\Scan") -Name "AutomaticallyCleanAfterScan" | Should -Be 0
        }
        It "Disable ScheduleDay" {
            Get-ItemPropertyValue ($Defender + "\Scan") -Name "ScheduleDay" | Should -Be 8
        }
        It "Disable AllowNonAdminFunctionality" {
            Get-ItemPropertyValue ($Defender + "\UX Configuration") -Name "AllowNonAdminFunctionality" | Should -Be 0
        }
        It "Disable DisablePrivacyMode" {
            Get-ItemPropertyValue ($Defender + "\UX Configuration") -Name "DisablePrivacyMode" | Should -Be 1
        }
    }
    Context "Windows Defender Feature Registry Wow6432" -Tags "Security" {
        BeforeAll {
            $DefenderWow6432 = "HKLM:\Software\Wow6432Node\Microsoft\Windows Defender"
        }
        It "Disable AntiSpyware" {
            Get-ItemPropertyValue $DefenderWow6432 -Name "DisableAntiSpyware" | Should -Be 1
        }
        It "Disable DisableRoutinelyTakingAction" {
            Get-ItemPropertyValue $DefenderWow6432 -Name "DisableRoutinelyTakingAction" | Should -Be 1
        }
        It "Disable ProductStatus" {
            Get-ItemPropertyValue $DefenderWow6432 -Name "ProductStatus" | Should -Be 0
        }
        It "Disable DisableAntiSpywareRealtimeProtection" {
            Get-ItemPropertyValue ($DefenderWow6432 + "\Real-Time Protection") -Name "DisableAntiSpywareRealtimeProtection" | Should -Be 1
        }
        It "Disable DisableRealtimeMonitoring" {
            Get-ItemPropertyValue ($DefenderWow6432 + "\Real-Time Protection") -Name "DisableRealtimeMonitoring" | Should -Be 1
        }
        It "Disable AutomaticallyCleanAfterScan" {
            Get-ItemPropertyValue ($DefenderWow6432 + "\Scan") -Name "AutomaticallyCleanAfterScan" | Should -Be 0
        }
        It "Disable ScheduleDay" {
            Get-ItemPropertyValue ($DefenderWow6432 + "\Scan") -Name "ScheduleDay" | Should -Be 8
        }
        It "Disable AllowNonAdminFunctionality" {
            Get-ItemPropertyValue ($DefenderWow6432 + "\UX Configuration") -Name "AllowNonAdminFunctionality" | Should -Be 0
        }
        It "Disable DisablePrivacyMode" {
            Get-ItemPropertyValue ($DefenderWow6432 + "\UX Configuration") -Name "DisablePrivacyMode" | Should -Be 1
        }
    }
    Context "Windows Defender Services are Disabled" -Tags "Security" {
        It "<_> is stopped - ControlSet001" -ForEach @(
            "WinDefend",
            "WdBoot",
            "WdFilter",
            "WdNisDrv",
            "WdNisSvc"
        ) {
            Get-ItemPropertyValue "HKLM:\SYSTEM\ControlSet001\Services\$_" -Name "Start" | Should -Be 4
        }
        It "<_> is stopped - ControlSet002" -ForEach @(
            "WinDefend",
            "WdBoot",
            "WdFilter",
            "WdNisDrv",
            "WdNisSvc"
        ) {
            Get-ItemPropertyValue "HKLM:\SYSTEM\ControlSet002\Services\$_" -Name "Start" | Should -Be 4
        }
        It "<_> is stopped - CurrentControlSet" -ForEach @(
            "WinDefend",
            "WdBoot",
            "WdFilter",
            "WdNisDrv",
            "WdNisSvc"
        ) {
            Get-ItemPropertyValue "HKLM:\SYSTEM\CurrentControlSet\Services\$_" -Name "Start" | Should -Be 4
        }
    }
    Context "Disable Local Clipboard" -Tags "Azure" {
        BeforeAll {
            #$clipboard =
        }
        It "Service is stopped" {
            (Get-Service -Name "cbdhsvc_*").Status | Should -Be "Stopped"
        }
        It "<_> is set to disabled" -Foreach @(
            (Get-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\cbdhsvc*").PSChildName
        ){
            Get-ItemPropertyValue "HKLM:\SYSTEM\CurrentControlSet\Services\$_" -Name "Start" | Should -Be 4
        }
    }
}


<#
include roles_profiles::profiles::disable_services
include roles_profiles::profiles::suppress_dialog_boxes
include roles_profiles::profiles::files_system_managment
include roles_profiles::profiles::firewall
include roles_profiles::profiles::network
include roles_profiles::profiles::ntp
include roles_profiles::profiles::power_management
include roles_profiles::profiles::scheduled_tasks
include roles_profiles::profiles::azure_vm_agent
include roles_profiles::profiles::virtual_drivers
include roles_profiles::profiles::gpu_drivers
#>