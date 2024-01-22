#Set-ExecutionPolicy RemoteSigned 
$env:ChocolateyUseWindowsCompression='false'
Invoke-Expression -Command  ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
# Uses dism.exe to install the IIS role.
#Dism.exe /online /enable-feature /all /featurename:iis-webserver /NoRestart
# Creates an HTML file and adds content to this file.
#Echo "Hello World - Dockerfile" > c:\inetpub\wwwroot\index.html
#Enable global Allow to avoid confirmation prompts and install in silence mode
Choco feature enable -n=allowGlobalConfirmation
#Avoid restart at dontnet sdk install
Choco install  -y --ignore-package-exit-codes=3010 dotnet-sdk  
#install nuget commandline 
#Choco install nuget.commandline --allow-empty-checksums -y
#efreshEnv.cmd does not work when run from this process. If you're in PowerShell, please 'Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1' and try again.
#Import-Module $env:ChocolateyInstall\helpers\chocolateyProfile.psm1
# Install build tools
#Choco install microsoft-build-tools 
$env:Path =  $env:Path + 'C:\Program Files\dotnet\;'
Write-Host $env:Path 
Write-Host "Hello from docker! Today is $(Get-Date)"
CD  "c:/workspace"
dotnet build

