@echo off
rem Usage: build [Release]
rem   Release   - build in enduser mode

rem ============================================= Parse Arguments
set BUILDSUB_MODE=
if "%~1" == "Release" set BUILDSUB_MODE=Release

rem ============================================= Configure
set BUILDSUB_UNIT_NAME=Convertn
set BUILDSUB_LOG_DIR=%~dp0\log
if not "%XDS_GLOBAL_LOG_DIR%" == "" set BUILDSUB_LOG_DIR=%XDS_GLOBAL_LOG_DIR%

call clean.bat
if not exist "%BUILDSUB_LOG_DIR%"  mkdir "%BUILDSUB_LOG_DIR%"

echo Build %BUILDSUB_UNIT_NAME%: convernt
set BUILDSUB_LOG_FILE=%BUILDSUB_LOG_DIR%\%BUILDSUB_UNIT_NAME%-convernt.out
call mkf.bat %BUILDSUB_MODE%  1>  "%BUILDSUB_LOG_FILE%" 2>&1 || goto lbl_Error
goto lbl_Success

rem ============================================= Script Messages
:lbl_Success
echo ======= %BUILDSUB_UNIT_NAME% ======= OK!
goto :EOF

:lbl_Error
echo ******* %BUILDSUB_UNIT_NAME% ******* Failed! =^> "%BUILDSUB_LOG_FILE%"
set BUILD_errorlevel=1
if "%BUILD_ERROR_LOG_FILE%" == "" set BUILD_ERROR_LOG_FILE=%BUILD_LOG_FILE%
exit /B 1



 