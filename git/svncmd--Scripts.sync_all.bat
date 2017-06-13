@echo off

pushd "%~dp0svncmd--Scripts" && (
  call :CMD git pull origin master || ( popd & goto EXIT )
  call :CMD git svn fetch || ( popd & goto EXIT )
  call :CMD git svn rebase || ( popd & goto EXIT )
  call :CMD git push origin master || ( popd & goto EXIT )
)

:EXIT
pause
exit /b

:CMD
echo.^>%*
(%*)
echo.
