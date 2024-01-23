# Learn about building .NET container images:
# https://github.com/dotnet/dotnet-docker/blob/main/samples/README.md
FROM mcr.microsoft.com/dotnet/sdk:8.0-windowsservercore-ltsc2022 AS build
WORKDIR /opt/buildspace

# copy csproj and restore as distinct layers
COPY *.csproj .
RUN dotnet restore --ucr

# copy and publish app and libraries
COPY . .
RUN dotnet publish --ucr --no-restore  -o /opt/app

# final stage/image
FROM mcr.microsoft.com/dotnet/runtime:8.0-windowsservercore-ltsc2022
WORKDIR /opt/app
COPY --from=build /opt/app .
USER ContainerUser
ENTRYPOINT ["dotnet","consoleapp.dll"]