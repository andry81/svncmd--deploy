@echo off

echo.^>%~dpnx0

setlocal

if not defined NEST_LVL set NEST_LVL=0

set /A NEST_LVL+=1

(
  echo.@echo off
  echo.
  echo.set PROJECT_NAME=svncmd
  echo.set "WCROOT_OFFSET=../../../../_%%PROJECT_NAME%%"
  echo.
  echo.rem primary mirror: github.com
  echo.set "GIT.REPO_OWNER=andry81"
  echo.
  echo.rem secondary mirror: bitbucket.org
  echo.set "GIT2.REPO_OWNER=andry81"
  echo.
  echo.set "SVNCMD_ROOT.SVN.REPOROOT=https://svn.code.sf.net/p/svncmd/scripts"
  echo.set "SVNCMD_DEPLOY.SVN.REPOROOT=https://svn.code.sf.net/p/svncmd/deploy"
  echo.
  echo.set "SVNCMD_DEPLOY.GIT.ORIGIN=https://%%GIT.USER%%@github.com/%%GIT.REPO_OWNER%%/svncmd--deploy.git"
  echo.set "SVNCMD_ROOT.GIT.ORIGIN=https://%%GIT.USER%%@github.com/%%GIT.REPO_OWNER%%/svncmd.git"
  echo.set "SVNCMD_SCRIPTS.GIT.ORIGIN=https://%%GIT.USER%%@github.com/%%GIT.REPO_OWNER%%/svncmd--Scripts.git"
  echo.set "SVNCMD_TOOLS.GIT.ORIGIN=https://%%GIT.USER%%@github.com/%%GIT.REPO_OWNER%%/contools--Tools.git"
  echo.set "EXTERNAL_TOOLS.GIT.ORIGIN=https://%%GIT.USER%%@github.com/%%GIT.REPO_OWNER%%/external_tools.git"
  echo.
  echo.set "SVNCMD_DEPLOY.GIT2.ORIGIN=https://%%GIT2.USER%%@bitbucket.org/%%GIT2.REPO_OWNER%%/svncmd-deploy.git"
  echo.set "SVNCMD_ROOT.GIT2.ORIGIN=https://%%GIT2.USER%%@bitbucket.org/%%GIT2.REPO_OWNER%%/svncmd.git"
  echo.set "SVNCMD_SCRIPTS.GIT2.ORIGIN=https://%%GIT2.USER%%@bitbucket.org/%%GIT2.REPO_OWNER%%/svncmd-scripts.git"
  echo.set "SVNCMD_TOOLS.GIT2.ORIGIN=https://%%GIT2.USER%%@bitbucket.org/%%GIT2.REPO_OWNER%%/contools-tools.git"
  echo.set "EXTERNAL_TOOLS.GIT2.ORIGIN=https://%%GIT2.USER%%@bitbucket.org/%%GIT2.REPO_OWNER%%/external_tools.git"
  echo.
) > "%~dp0configure.user.bat"

for /F "usebackq eol=	 tokens=* delims=" %%i in (`dir /A:D /B "%~dp0*.*"`) do (
  set "DIR=%%i"
  call :PROCESS_DIR
)

set /A NEST_LVL-=1

if %NEST_LVL% LEQ 0 pause

exit /b 0

:PROCESS_DIR
rem ignore directories beginning by `.`
if "%DIR:~0,1%" == "." exit /b 0

if exist "%~dp0%DIR%\configure.bat" call :CMD "%%~dp0%%DIR%%\configure.bat"

exit /b

:CMD
echo.^>%*
(%*)
