@echo off

if not "%1" == "86" if not "%1" == "64" (
    echo Specify 86 or 64 as the first argument.
    exit /b
)

set ROOT_DIR=%~dp0\..\
pushd "%ROOT_DIR%"

call scripts\update.cmd

if not exist build_x%1 (
    md build_x%1
)

cd build_x%1

set THIRDPARTY_DIR=%ROOT_DIR%thirdparty\
set DX_INCLUDE_DIR=%THIRDPARTY_DIR%directx\include
set DX_LIB_DIR=%THIRDPARTY_DIR%directx\lib\x%1\

:: FMOD Ex
set FMOD_TYPE=fmodex
:: FMOD Studio Low Level API
::set FMOD_TYPE=fmod

if "%1" == "86" (
    set CMAKE_ARCH=Win32
) else (
    set CMAKE_ARCH=x64
    set FMOD_SUFFIX=64
)

%THIRDPARTY_DIR%cmake\bin\cmake.exe ^
    %CMAKE_GENERATOR% ^
    %CMAKE_TOOLSET% ^
    -A %CMAKE_ARCH% ^
    -DD3D_INCLUDE_DIR="%DX_INCLUDE_DIR%" ^
    -DXINPUT_INCLUDE_DIR="%DX_INCLUDE_DIR%" ^
    -DDX_dinput8_LIBRARY="%DX_LIB_DIR%dinput8.lib" ^
    -DDX_dxguid_LIBRARY="%DX_LIB_DIR%dxguid.lib" ^
    -DNASM_PATH="%THIRDPARTY_DIR%nasm\nasm.exe" ^
    -DGLEW_INCLUDE_DIR="%THIRDPARTY_DIR%glew\include" ^
    -DGLEW_LIBRARY="%THIRDPARTY_DIR%glew\lib\x%1\glew32.lib" ^
    -DFMOD_INCLUDE_DIR="%THIRDPARTY_DIR%%FMOD_TYPE%\inc" ^
    -DFMOD_LIBRARY="%THIRDPARTY_DIR%%FMOD_TYPE%\lib\%FMOD_TYPE%%FMOD_SUFFIX%_vc.lib" ^
    -DOPENAL_INCLUDE_DIR="%THIRDPARTY_DIR%openal\include" ^
    -DOPENAL_LIBRARY="%THIRDPARTY_DIR%openal\lib\x%1\OpenAL32.lib" ^
    -DSNDFILE_INCLUDE_DIR="%THIRDPARTY_DIR%sndfile\include" ^
    -DSNDFILE_LIBRARY="%THIRDPARTY_DIR%sndfile\lib\x%1\libsndfile-1.lib" ^
    -DMPG123_INCLUDE_DIR="%THIRDPARTY_DIR%mpg123\include" ^
    -DMPG123_LIBRARIES="%THIRDPARTY_DIR%mpg123\lib\x%1\libmpg123-0.lib" ^
    ..\gzdoom

if %ERRORLEVEL% neq 0 (
    echo Error: Failed to generate Visual Studio solution.
    popd
    exit /b
)

set DLL_FILES=^
    glew\bin\x%1\glew32.dll ^
    %FMOD_TYPE%\bin\%FMOD_TYPE%%FMOD_SUFFIX%.dll ^
    openal\bin\x%1\OpenAL32.dll ^
    openal\bin\x%1\wrap_oal.dll ^
    mpg123\bin\x%1\libmpg123-0.dll ^
    sndfile\bin\x%1\libsndfile-1.dll

if "%1" == "86" (
    set "DLL_FILES=%DLL_FILES% mpg123\bin\x%1\libgcc_s_sjlj-1.dll"
)

for %%d in (Debug Release MinSizeRel RelWithDebInfo) do (
    if not exist %%d (
        md %%d
    )

    for %%f in (%DLL_FILES%) do (
        xcopy "%THIRDPARTY_DIR%\%%f" %%d /D /Y >nul
    )
)

popd
