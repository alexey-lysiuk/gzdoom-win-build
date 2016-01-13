@echo off

if defined CMAKE_TOOLSET (
    goto :eof
)

set VS_COMNTOOLS_2010=%VS100COMNTOOLS%
set VS_COMNTOOLS_2012=%VS110COMNTOOLS%
set VS_COMNTOOLS_2013=%VS120COMNTOOLS%
set VS_COMNTOOLS_2015=%VS140COMNTOOLS%

set VS_TOOLSET_2010=v100
set VS_TOOLSET_2012=v110_xp
set VS_TOOLSET_2013=v120_xp
set VS_TOOLSET_2015=v140_xp

::  The same idea as in CMake:
::  Check for the newest Visual Studio installed and setup its build environment

for %%v in (2015 2013 2012 2010) do (
    call :SetupEnvironment %%v

    if defined CMAKE_TOOLSET (
        goto :eof
    )
)

goto :eof

:SetupEnvironment
    if not defined VS_COMNTOOLS_%1 (
        goto :eof
    )

    call "%%VS_COMNTOOLS_%1%%vsvars32.bat"

    if %ERRORLEVEL% neq 0 (
        goto :eof
    )

    call set "CMAKE_TOOLSET=-T %%VS_TOOLSET_%1%%"
    goto :eof
