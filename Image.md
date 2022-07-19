# What to test within image

Link to Applications: https://s3.console.aws.amazon.com/s3/buckets/ronin-puppet-package-repo?region=us-west-2&prefix=Windows/&showversions=false


* Azure vm agent https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/roles/win10642004azure.pp#L16
* virtual drivers/audio cable https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/roles/win10642004azure.pp#L17
* logging https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/roles/win10642004azure.pp#L21
* process_debug https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/profiles/common_tools.pp#L9
* jq https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/profiles/common_tools.pp#L10
* gpg4win https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/profiles/common_tools.pp#L11
* 7-zip https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/profiles/common_tools.pp#L12
* sublimetext - https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/profiles/common_tools.pp#L13
* git https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/roles/win10642004azure.pp#L28
* if 2004, then vs_buildtools https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/profiles/microsoft_tools.pp#L19
* vc_x86 https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/profiles/microsoft_tools.pp#L21
* vc_x64 https://github.com/mozilla-platform-ops/ronin_puppet/blob/master/modules/roles_profiles/manifests/profiles/microsoft_tools.pp#L22
* mozilla_build https://wiki.mozilla.org/MozillaBuild
* mozilla maintenance service https://support.mozilla.org/en-US/kb/what-mozilla-maintenance-service
* nssm https://support.mozilla.org/en-US/kb/what-mozilla-maintenance-service
* performance tool kit - WPTx64-x86_en-us.msi from S3 bucket

## Non-application installs

```Ruby
 ## Windows
  include roles_profiles::profiles::disable_services
    include win_disable_services::disable_wsearch
    include win_disable_services::disable_puppet
    include win_disable_services::disable_windows_update
    ## if Windows 10
    include win_disable_services::disable_onedrive
    ## if Windows 10 1903 or 2004
    include win_disable_services::disable_windows_defender_schtask
    ## else
    include win_disable_services::disable_windows_defender
    ## if Azure
    include win_scheduled_tasks::kill_local_clipboard

  include roles_profiles::profiles::suppress_dialog_boxes
    include win_os_settings::disbale_notifications

  include roles_profiles::profiles::files_system_managment
    include win_filesystem::disable8dot3
    include win_filesystem::disablelastaccess
    ## if Azure
    win_filesystem::set_paging_file

  include roles_profiles::profiles::firewall
    include win_firewall::allow_ping
    ## if in aws and firewall is running
    include win_firewall::disable_firewall

  include roles_profiles::profiles::network
    ## if win net category is not private, set private
    include win_network::disable_ipv6

  include roles_profiles::profiles::ntp
  include roles_profiles::profiles::power_management
  include roles_profiles::profiles::scheduled_tasks
    ## if azure
    include win_scheduled_tasks::at_task_user_logon
```
