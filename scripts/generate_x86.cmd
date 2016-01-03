@echo off

set ROOT_DIR=%~dp0\..\
pushd "%ROOT_DIR%"

if not exist build_x86 (
    md build_x86
)

cd build_x86

set THIRDPARTY_DIR=%ROOT_DIR%thirdparty\
set DX_INCLUDE_DIR=%THIRDPARTY_DIR%directx\include
set DX_LIB_DIR=%THIRDPARTY_DIR%directx\lib\x86\

%THIRDPARTY_DIR%cmake\bin\cmake.exe ^
    -DD3D_INCLUDE_DIR="%DX_INCLUDE_DIR%" ^
    -DXINPUT_INCLUDE_DIR="%DX_INCLUDE_DIR%" ^
    -DDX_dinput8_LIBRARY="%DX_LIB_DIR%dinput8.lib" ^
    -DDX_dxguid_LIBRARY="%DX_LIB_DIR%dxguid.lib" ^
    -DNASM_PATH="%THIRDPARTY_DIR%nasm\nasm.exe" ^
    -DGLEW_INCLUDE_DIR="%THIRDPARTY_DIR%glew\include" ^
    -DGLEW_LIBRARY="%THIRDPARTY_DIR%glew\lib\x86\glew32.lib" ^
    -DFMOD_INCLUDE_DIR="%THIRDPARTY_DIR%fmod\inc" ^
    -DFMOD_LIBRARY="%THIRDPARTY_DIR%fmod\lib\fmodex_vc.lib" ^
    -DOPENAL_INCLUDE_DIR="%THIRDPARTY_DIR%openal\include" ^
    -DOPENAL_LIBRARY="%THIRDPARTY_DIR%openal\lib\x86\OpenAL32.lib" ^
    -DSNDFILE_INCLUDE_DIR="%THIRDPARTY_DIR%sndfile\include" ^
    -DSNDFILE_LIBRARY="%THIRDPARTY_DIR%sndfile\lib\x86\libsndfile-1.lib" ^
    -DMPG123_INCLUDE_DIR="%THIRDPARTY_DIR%mpg123\include" ^
    -DMPG123_LIBRARIES="%THIRDPARTY_DIR%mpg123\lib\x86\libmpg123-0.lib" ^
    ..\gzdoom

for %%d in (Debug Release MinSizeRel RelWithDebInfo) do (
    if not exist %%d (
        md %%d
    )
    xcopy "%THIRDPARTY_DIR%\glew\bin\x86\glew32.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\fmod\bin\fmodex.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\openal\bin\x86\OpenAL32.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\openal\bin\x86\wrap_oal.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\mpg123\bin\x86\libmpg123-0.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\mpg123\bin\x86\libgcc_s_sjlj-1.dll" %%d /D /Y >nul
    xcopy "%THIRDPARTY_DIR%\sndfile\bin\x86\libsndfile-1.dll" %%d /D /Y >nul
)

popd
