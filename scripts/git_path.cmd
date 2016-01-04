@echo off

where git 1>nul 2>nul

if %ERRORLEVEL% equ 0 (
    exit /b
)

set PATH=%~dp0..\thirdparty\git\bin;%PATH%
