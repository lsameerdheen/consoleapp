# Sample Dockerfile

# Indicates that the windowsservercore image will be used as the base image.
FROM  mcr.microsoft.com/dotnet/framework/runtime:4.8.1 as baseimage

# Metadata indicating an image maintainer.
LABEL maintainer="ameerdeen@gmail.com"

# clean up iis server web root
#RUN powershell remove-item C:\inetpub\wwwroot\iisstart.*

RUN mkdir "c:/workspace"
WORKDIR "c:/workspace"
COPY . "c:\workspace"
#COPY . "c:/workspace"
EXPOSE 5555
SHELL ["cmd", "/S", "/C"]
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]
RUN powershell -ExecutionPolicy Bypass -File "c:/workspace/Start.ps1" 
SHELL ["cmd", "/S", "/C"]
RUN CD "c:/workspace/bin/Debug/net8.0/"
CMD [ "cmd" , "consoleapp.exe"] 

#RUN powershell -NoProfile -ExecutionPolicy Bypass -Command "$env:ChocolateyUseWindowsCompression='false'; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
#RUN powershell dism.exe /online /enable-feature /all /featurename:iis-webserver /NoRestart
#RUN powershell choco feature enable -n=allowGlobalConfirmation
#RUN powershell choco install  -y --ignore-package-exit-codes=3010 dotnet-sdk  
#RUN powershell choco install nuget.commandline --allow-empty-checksums -y
#RUN powershell choco install microsoft-build-tools 
# Sets a command or process that will run each time a container is run from the new image.
#CMD [ "cmd" , "dotnet" , "run"] 
