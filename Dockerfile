FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
ENV ASPNETCORE_URLS=http://+:80
FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
ARG configuration=Release
WORKDIR /src
COPY ["GadgetsOnline/GadgetsOnline.csproj", "GadgetsOnline/"]
RUN dotnet restore "GadgetsOnline/GadgetsOnline.csproj"
COPY . .
WORKDIR "/src/GadgetsOnline"
RUN dotnet build "GadgetsOnline.csproj" -c $configuration -o /app/build
FROM build AS publish
ARG configuration=Release
RUN dotnet publish "GadgetsOnline.csproj" -c $configuration -o /app/publish /p:UseAppHost=false
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "GadgetsOnline.dll"]