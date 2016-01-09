@echo off

:: Remote for GZDoom is always present
set REMOTE_NAME=
set REMOTE_URL=

echo. 
echo ^+----------------------------------------------------------^+
echo ^|  Press the corresponding button to switch to a version:  ^|
echo ^+----------------------------------------------------------^+
echo ^|  1 - GZDoom 1.8.x                                        ^|
echo ^|  2 - GZDoom 2.x.x                                        ^|
echo ^|  3 - GZDoom GPL                                          ^|
echo ^|  4 - GLOOME                                              ^|
echo ^|  5 - ZDoom                                               ^|
echo ^+----------------------------------------------------------^+
echo ^|  0 - Exit                                                ^|
echo ^+----------------------------------------------------------^+
echo.

choice /c 123450

if %ERRORLEVEL% equ 1 (
    set BRANCH_LOCAL=gzdoom-18x
    set BRANCH_REMOTE=gzdoom/g1.8
) else if %ERRORLEVEL% equ 2 (
    set BRANCH_LOCAL=gzdoom-2xx
    set BRANCH_REMOTE=gzdoom/master
) else if %ERRORLEVEL% equ 3 (
    set REMOTE_NAME=gzdoom-gpl
    set REMOTE_URL=https://github.com/nashmuhandes/GZDoom-GPL.git
    set BRANCH_LOCAL=gzdoom-gpl
    set BRANCH_REMOTE=gzdoom-gpl/master
) else if %ERRORLEVEL% equ 4 (
    set REMOTE_NAME=gloome
    set REMOTE_URL=https://github.com/marrub--/GLOOME.git
    set BRANCH_LOCAL=gloome
    set BRANCH_REMOTE=gloome/master
) else if %ERRORLEVEL% equ 5 (
    set REMOTE_NAME=zdoom
    set REMOTE_URL=https://github.com/rheit/zdoom.git
    set BRANCH_LOCAL=zdoom
    set BRANCH_REMOTE=zdoom/master
) else (
    exit /b
)

pushd "%~dp0"

echo.
call scripts\git_path.cmd
call scripts\setup.cmd

:: TODO add check for switching to the same branch
call scripts\cleanup.cmd 86
call scripts\cleanup.cmd 64

cd gzdoom
git fetch --all

if defined REMOTE_NAME (
    call :AddRemote %REMOTE_NAME% %REMOTE_URL%
)

call :CheckoutBranch %BRANCH_LOCAL% %BRANCH_REMOTE%

popd

echo.
pause

goto :eof

:AddRemote
    :: %1 - remote name
    :: %2 - remote url
    :: 'more' converts Unix to DOS line endings, i.e. <LF> to <CR><LF>
    git remote | more | findstr \^<%1\^> >nul

    if %ERRORLEVEL% neq 0 (
        git remote add -f %1 %2
    )

    goto :eof

:CheckoutBranch
    :: %1 - local branch name
    :: %2 - remote branch name
    :: 'more' converts Unix to DOS line endings, i.e. <LF> to <CR><LF>
    git branch | more | findstr \^<%1\^> >nul

    if %ERRORLEVEL% neq 0 (
        git branch --track %1 %2
    )

    git checkout %1

    goto :eof
