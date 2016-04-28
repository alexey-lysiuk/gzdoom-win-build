@echo off

choice /M "Are you sure to delete intermediate files"

if %ERRORLEVEL% equ 1 (
    cd "%~dp0"
    rd /S /Q gzdoom 2>nul
    rd /S /Q build_x86 2>nul
    rd /S /Q build_x64 2>nul
    echo Done.
)

pause
