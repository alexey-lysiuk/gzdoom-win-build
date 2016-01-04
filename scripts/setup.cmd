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
git branch --track gz_master gzdoom/master
git checkout gz_master
git branch --delete master

popd
