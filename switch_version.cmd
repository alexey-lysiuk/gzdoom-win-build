@echo off

echo. 
echo ^+----------------------------------------------------------^+
echo ^|  Press the corresponding button to switch to a version:  ^|
echo ^+----------------------------------------------------------^+
echo ^|  1 - GZDoom 2.x.x                                        ^|
echo ^|  2 - GZDoom 1.8.x                                        ^|
echo ^|  3 - ZDoom                                               ^|
echo ^+----------------------------------------------------------^+
echo ^|  0 - Exit                                                ^|
echo ^+----------------------------------------------------------^+
echo.

choice /c 1230

if %ERRORLEVEL% equ 1 (
    set BRANCH=gz_master
) else if %ERRORLEVEL% equ 2 (
    set BRANCH=gz_18x
) else if %ERRORLEVEL% equ 3 (
    set BRANCH=z_master
) else (
    exit /b
)

pushd "%~dp0"

echo.
call scripts\update.cmd

cd gzdoom
git checkout %BRANCH%

popd

pause
