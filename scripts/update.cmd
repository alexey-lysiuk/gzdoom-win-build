@echo off

set ROOT_DIR=%~dp0\..\
pushd "%ROOT_DIR%"

set PATH=%ROOT_DIR%thirdparty\git\bin;%PATH%

if not exist gzdoom (
    git clone https://github.com/coelckers/gzdoom.git

    cd gzdoom
    git remote rename origin gzdoom
    git remote add zdoom https://github.com/rheit/zdoom.git
    git fetch --all
    git branch --track gz_master gzdoom/master
    git branch --track gz_18x gzdoom/g1.8
    git branch --track z_master zdoom/master
    git checkout gz_master
    git branch --delete master
) else (
    cd gzdoom
    git fetch --all
    git pull
)

popd
