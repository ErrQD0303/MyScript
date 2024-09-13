@echo off
REM This batch is designed to make a DSA Project
:: Author: ErrQD3396 - Dat Nguyen Quoc

if "%~1"=="" (
    echo Error: Missing project name argument.
    exit /b 1
)

set c#Repos=C:\Users\ADMIN\source\repos
set file=%c#Repos%\%~1

dotnet new sln -o %file%

cd /D %file%

if "%~2"=="" (
    dotnet new console -o "%~1"
) else if "%~2"=="console" (
    dotnet new console -o "%~1"
) else if "%~2"=="-c" (
    dotnet new console -o "%~1"
) else if "%~2"=="webapi" (
    dotnet new webapi --use-controllers -o "%~1"
    cd "%~1"
    dotnet add package Microsoft.EntityFrameworkCore.InMemory
    cd ..
) else if "%~2"=="-w" (
    dotnet new webapi --use-controllers -o "%~1"
    cd "%~1"
    dotnet add package Microsoft.EntityFrameworkCore.InMemory
    cd ..
) else (
    echo Error: Invalid option "%~2". Use "console" or "webapi".
    exit /b 1
)

code -r %1