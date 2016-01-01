@echo off

set ROOT_DIR=%~dp0\..\
pushd "%ROOT_DIR%"

set PATH=%ROOT_DIR%thirdparty\git\bin;%PATH%\

if not exist gzdoom (
    git clone https://github.com/coelckers/gzdoom.git
    cd gzdoom
    git remote add rheit https://github.com/rheit/zdoom.git
    cd ..
)

cd gzdoom
git fetch --all
git pull

popd
