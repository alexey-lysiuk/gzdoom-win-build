@echo off

pushd "%~dp0"

call git_path.cmd
call setup.cmd

cd ..\gzdoom
git pull

popd
