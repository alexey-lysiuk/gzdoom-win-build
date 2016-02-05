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
git branch --track gzdoom-1x gzdoom/g1.x
git checkout gzdoom-1x
git branch --delete master

popd
