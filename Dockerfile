FROM mcr.microsoft.com/dotnet/core/sdk:3.0 AS build
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.sln .
COPY hello-world/*.csproj ./hello-world/
RUN dotnet restore

# copy everything else and build app
COPY hello-world/. ./hello-world/
WORKDIR /app/hello-world
RUN dotnet publish -c Release -o out


FROM mcr.microsoft.com/dotnet/core/aspnet:3.0 AS runtime
WORKDIR /app
COPY --from=build /app/hello-world/out ./
ENTRYPOINT ["dotnet", "hello-world.dll"]
