@echo off

if not "%1" == "86" if not "%1" == "64" (
    echo Specify 86 or 64 as the first argument.
    exit /b
)

pushd "%~dp0"

if exist ..\build_x%1 (
    cd ..\build_x%1
    del CMakeCache.txt 1>nul 2>nul

    for %%d in (Debug Release MinSizeRel RelWithDebInfo) do (
        call :DeleteGeneratedFiles %%d
    )
)

if exist ..\build_x%1 (
    cd ..\bin_x%1
    call :DeleteGeneratedFiles .
)

popd

goto :eof

:DeleteGeneratedFiles
    del %1\*.exe 1>nul 2>nul
    del %1\*.pdb 1>nul 2>nul
    del %1\*.pk3 1>nul 2>nul

    goto :eof
