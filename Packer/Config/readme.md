# A few notes

```YAML
---
image:
    publisher: MicrosoftWindowsDesktop
    offer: Windows-11
    sku: 21h2-avd
azure:
    managed_image_resource_group_name: rg-packer-through-cib
    managed_image_storage_account_type: Standard_LRS
    build_location: eastus
    locations:
        - centralus
        - eastus

vm:
    size: Standard_F8s_v2
    tags:
        base_image: win10642004azure ## Maps to https://github.com/mozilla-platform-ops/ronin_puppet/blob/cloud_windows/modules/roles_profiles/manifests/roles/win10642004azure.pp & https://github.com/mozilla-platform-ops/ronin_puppet/blob/cloud_windows/data/roles/win10642004azure.yaml
        worker_pool_id: win10-64-2004 ## used inside of taskcluster
        sourceOrganisation: mozilla-platform-ops
        sourceRepository: ronin_puppet
        sourceBranch: cloud_windows
        deploymentId: 83f218d ## First 7 characters of the commit hash of ronin_puppet
        managed_by: packer
```

facts_win_directories.ps1 passes the value back to puppet as a fact
win11-64-XXX-alpha can be renamed anytime