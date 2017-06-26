@echo off

setlocal

(
  echo.@echo off
  echo.
  echo set "GIT.REPO_OWNER=andry81"
  echo set "GIT.USER=user"
  echo set "GIT.EMAIL=user@mail.com"
  echo.
  echo set "SVNCMD_ROOT.SVN.REPOROOT=https://svn.code.sf.net/p/svncmd/scripts/trunk"
  echo.
  echo set "SVNCMD_ROOT.GIT.ORIGIN=https://github.com/%%GIT.REPO_OWNER%%/svncmd.git"
  echo set "SVNCMD_SCRIPTS.GIT.ORIGIN=https://github.com/%%GIT.REPO_OWNER%%/svncmd--Scripts.git"
  echo set "SVNCMD_TOOLS.GIT.ORIGIN=https://github.com/%%GIT.REPO_OWNER%%/contools--Tools.git"
  echo set "EXTERNAL_TOOLS.GIT.ORIGIN=https://github.com/%%GIT.REPO_OWNER%%/external_tools.git"
) > "%~dp0configure.user.bat"
