@echo off

echo.^>%~dpnx0

setlocal

if not defined NEST_LVL set NEST_LVL=0

set /A NEST_LVL+=1

(
  echo.@echo off
  echo.
  rem echo.set "SVN.WCROOT_DIR=sf~Scripts"
  echo.set "GIT.WCROOT_DIR=gh~svncmd--Scripts"
  echo.set "GIT2.WCROOT_DIR=bb~svncmd--Scripts"
  echo.
) > "%~dp0configure.user.bat"

set /A NEST_LVL-=1

if %NEST_LVL% LEQ 0 pause

exit /b
