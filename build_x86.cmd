@echo off

pushd "%~dp0"

call scripts\update.cmd
call scripts\generate_x86.cmd
call scripts\build.cmd 86

popd

pause
