@echo off

pushd "%~dp0"

call scripts\update.cmd
call scripts\generate_x64.cmd
call scripts\build.cmd 64

popd

pause
