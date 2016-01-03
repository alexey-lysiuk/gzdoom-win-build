@echo off

for %%v in ("%VS140COMNTOOLS%" "%VS120COMNTOOLS%" "%VS110COMNTOOLS%" "%VS100COMNTOOLS%" "%VS90COMNTOOLS%" "%VS80COMNTOOLS%") do (
    call "%%~vvsvars32.bat" 1>nul 2>nul

    if %ERRORLEVEL% equ 0 (
        exit /b
    )
)
