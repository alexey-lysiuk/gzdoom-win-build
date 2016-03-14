@echo off

if defined CMAKE_TOOLSET (
    goto :eof
)

set VS_COMNTOOLS_2015=%VS140COMNTOOLS%
set VS_TOOLSET_2015=v140_xp

::  Visual Studio 2015 is the only version supported at the moment
call :SetupEnvironment 2015

if defined CMAKE_TOOLSET (
    goto :eof
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
