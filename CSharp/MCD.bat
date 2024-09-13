@echo off
REM This batch is designed to make a DSA Project
:: Author: ErrQD3396 - Dat Nguyen Quoc

if "%~1"=="" (    
    echo MCD - Make C Sharp Directory - ErrQD0303
    echo Type /? for help
    exit /b 0
) else if "%~1"=="/?" (  
    echo MCD - Make C Sharp Directory
    echo.
    echo Syntax: MCD ^<Project-Name^> ^<Project-type^>
    echo.
    echo Valid Project Type:
    echo - Console App: console or -c
    echo - Web Api App: wepapi or -w
    exit /b 0
)

:: Change your c#Repos variable to the folder you want to install
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