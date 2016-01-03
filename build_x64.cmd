@echo off

pushd "%~dp0"

call scripts\update.cmd
call scripts\generate.cmd 64
call scripts\build.cmd 64

popd

pause
