@echo off

pushd "%~dp0"

if exist ..\gzdoom (
    popd
    exit /b
)

call git_path.cmd

cd ..
git clone https://github.com/coelckers/gzdoom.git

cd gzdoom
git remote rename origin gzdoom
git branch --track gzdoom-2xx gzdoom/master
git checkout gzdoom-2xx
git branch --delete master

popd
