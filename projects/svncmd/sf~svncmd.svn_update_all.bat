@echo off

setlocal

rem extract name of sync directory from name of the script
set "?~n0=%~n0"

set "WCROOT_SUFFIX=%?~n0:*.=%"

set "WCROOT=%?~n0%."
if "%WCROOT_SUFFIX%" == "%?~n0%" goto IGNORE_WCROOT_SUFFIX
call set "WCROOT=%%WCROOT:.%WCROOT_SUFFIX%.=%%"

:IGNORE_WCROOT_SUFFIX
if "%WCROOT:~-1%" == "." set "WCROOT=%WCROOT:~0,-1%"

if not "%WCROOT_OFFSET%" == "" set "WCROOT=%WCROOT_OFFSET%/%WCROOT%"

if "%NEST_LVL%" == "" set NEST_LVL=0

set /A NEST_LVL+=1

pushd "%~dp0%WCROOT%" && (
  call :CMD svn up || ( popd & goto EXIT )
  popd
)

:EXIT
set /A NEST_LVL-=1

if %NEST_LVL% LEQ 0 pause

exit /b

:CMD
echo.^>%*
(%*)
echo.
