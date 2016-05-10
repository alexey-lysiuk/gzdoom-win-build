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

popd
