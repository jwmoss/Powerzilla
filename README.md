# Powerzilla
Powershell scripts for interacting with resources within RelOps Mozilla

## Instructions

To create/bootstrap required modules, run the below:
```PowerShell
Invoke-PSDepend -Path RequiredModules.psd1 -Confirm:False
```