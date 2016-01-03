@echo off

if not "%1" == "86" if not "%1" == "64" (
    echo Specify 86 or 64 as the first argument.
    exit /b
)

pushd "%~dp0"

call :DetectSolutionName GZDoom

if not defined SOLUTION_NAME (
    call :DetectSolutionName ZDoom
)

if not defined SOLUTION_NAME (
    echo Error: Unknown ^(G^)ZDoom version.
    exit /b
)

:: Build
call vsvars.cmd
devenv ..\build_x%1\%SOLUTION_NAME%.sln /Build RelWithDebInfo

:: Copy
if not exist ..\bin_x%1 (
    md ..\bin_x%1
)

for %%e in (exe dll pk3 pdb) do (
    xcopy ..\build_x%1\RelWithDebInfo\*.%%e ..\bin_x%1 /D /Y >nul
)

popd

goto :eof

:DetectSolutionName
    findstr /i project\s*(\s*%1\s*) ..\gzdoom\CMakeLists.txt >nul

    if %ERRORLEVEL% equ 0 (
        set SOLUTION_NAME=%1
    ) else (
        set SOLUTION_NAME=
    )
