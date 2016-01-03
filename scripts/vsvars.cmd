@echo off

::  The same idea as in CMake:
::  Check for the newest Visual Studio installed and setup its build environment

for %%v in ("%VS140COMNTOOLS%" "%VS120COMNTOOLS%" "%VS110COMNTOOLS%" "%VS100COMNTOOLS%") do (
    call "%%~vvsvars32.bat" 1>nul 2>nul

    if %ERRORLEVEL% equ 0 (
        exit /b
    )
)
