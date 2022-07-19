# Powerzilla
Powershell scripts for interacting with resources within RelOps Mozilla

## Instructions

To create/bootstrap required modules, run the below:
```PowerShell
Invoke-PSDepend -Path RequiredModules.psd1 -Confirm:$False
```

## Worker pool ID used in TaskCluster

* https://firefox-ci-tc.services.mozilla.com/worker-manager/gecko-t%2Fwin10-64-2004
* gecko-t/win10-64-2004