@echo off

set ROOT_DIR=%~dp0\..\
pushd "%ROOT_DIR%"

if not exist build_x64 (
    md build_x64
)

cd build_x64

set THIRDPARTY_DIR=%ROOT_DIR%thirdparty\
set DX_INCLUDE_DIR=%THIRDPARTY_DIR%directx\include
set DX_LIB_DIR=%THIRDPARTY_DIR%directx\lib\x64\

%THIRDPARTY_DIR%cmake\bin\cmake.exe ^
    -A x64 ^
    -DD3D_INCLUDE_DIR="%DX_INCLUDE_DIR%" ^
    -DXINPUT_INCLUDE_DIR="%DX_INCLUDE_DIR%" ^
    -DDX_dinput8_LIBRARY="%DX_LIB_DIR%dinput8.lib" ^
    -DDX_dxguid_LIBRARY="%DX_LIB_DIR%dxguid.lib" ^
    -DGLEW_INCLUDE_DIR="%THIRDPARTY_DIR%glew\include" ^
    -DGLEW_LIBRARY="%THIRDPARTY_DIR%glew\lib\x64\glew32.lib" ^
    -DFMOD_INCLUDE_DIR="%THIRDPARTY_DIR%fmod\inc" ^
    -DFMOD_LIBRARY="%THIRDPARTY_DIR%fmod\lib\fmodex64_vc.lib" ^
    -DOPENAL_INCLUDE_DIR="%THIRDPARTY_DIR%openal\include" ^
    -DOPENAL_LIBRARY="%THIRDPARTY_DIR%openal\lib\x64\OpenAL32.lib" ^
    -DSNDFILE_INCLUDE_DIR="%THIRDPARTY_DIR%sndfile\include" ^
    -DSNDFILE_LIBRARY="%THIRDPARTY_DIR%sndfile\lib\x64\libsndfile-1.lib" ^
    -DMPG123_INCLUDE_DIR="%THIRDPARTY_DIR%mpg123\include" ^
    -DMPG123_LIBRARIES="%THIRDPARTY_DIR%mpg123\lib\x64\libmpg123-0.lib" ^
    ..\gzdoom

for %%d in (Debug Release MinSizeRel RelWithDebInfo) do (
    if not exist %%d (
        md %%d
    )
    xcopy "%THIRDPARTY_DIR%\glew\bin\x64\glew32.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\fmod\bin\fmodex64.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\openal\bin\x64\OpenAL32.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\mpg123\bin\x64\libmpg123-0.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\sndfile\bin\x64\libsndfile-1.dll" %%d /D /Y >nul
)

popd
