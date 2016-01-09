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
git branch --track gzdoom-18x gzdoom/g1.8
git checkout gzdoom-18x
git branch --delete master

popd
