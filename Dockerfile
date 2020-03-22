FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY Hello-World/*.csproj ./Hello-World/
RUN dotnet restore

# copy everything else and build app
COPY Hello-World/. ./Hello-World/
WORKDIR /app/Hello-World
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime
WORKDIR /app
COPY --from=build /app/Hello-World/out ./
ENTRYPOINT ["dotnet", "Hello-World.dll"]
