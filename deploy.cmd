@echo off

pushd "%~dp0scripts"

call git_path.cmd
call build.cmd 86
call build.cmd 64

cd ../gzdoom
set BUILD_BRANCH=
set BUILD_VERSION=
for /f "delims=" %%r in ('git rev-parse --abbrev-ref HEAD') do set BUILD_BRANCH=%%r
for /f "delims=" %%r in ('git describe --tags') do set BUILD_VERSION=%%r
cd ..

if not exist deploy (
    md deploy
)

call :MakeDeployZip 86
call :MakeDeployZip 64

popd

echo.
pause

goto :eof

:MakeDeployZip
    set DEPLOY_FILENAME=deploy\%BUILD_BRANCH%-x%1-%BUILD_VERSION%.zip
    thirdparty\zip\zip.exe -9j %DEPLOY_FILENAME% bin_x%1\*.exe bin_x%1\*.dll bin_x%1\*.pk3
    thirdparty\zip\zip.exe -9 %DEPLOY_FILENAME% licenses\*.*
    goto :eof
