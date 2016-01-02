@echo off

if "%1" == "" (
    echo Specify 86 or 64 as the first argument.
    exit /b
)

pushd "%~dp0"

:: Build
call vsvars.cmd
devenv ..\build_x%1\GZDoom.sln /Build RelWithDebInfo

:: Copy
if not exist ..\bin_x%1 (
    md ..\bin_x%1
)

for %%e in (exe dll pk3 pdb) do (
    xcopy ..\build_x%1\RelWithDebInfo\*.%%e ..\bin_x%1 /D /Y >nul
)

popd
