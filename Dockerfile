FROM mcr.microsoft.com/dotnet/core/runtime:3.1

COPY . /opt/source-code

ENTRYPOINT ["dotnet", "app/Hello-World.dll"]