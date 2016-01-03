@echo off

pushd "%~dp0"

call scripts\update.cmd
call scripts\generate.cmd 86
call scripts\build.cmd 86

popd

pause
