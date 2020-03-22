FROM mcr.microsoft.com/dotnet/core/runtime:3.1

COPY Hello-World/bin/Release/netcoreapp3.1/ Hello-World/

ENTRYPOINT ["dotnet", "app/Hello-World.dll"]