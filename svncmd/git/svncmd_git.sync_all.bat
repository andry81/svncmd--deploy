@echo off

pushd "%~dp0svncmd_git" && (
  call :CMD git pull origin master || ( popd & goto EXIT )
  call :CMD git subtree pull --prefix=Scripts scripts master || ( popd & goto EXIT )
  call :CMD git subtree pull --prefix=Tools --squash tools master || ( popd & goto EXIT )
  call :CMD git subtree pull --prefix=ToolsExternal --squash external-tools master || ( popd & goto EXIT )
  call :CMD git push origin master || ( popd & goto EXIT )
)

:EXIT
pause
exit /b

:CMD
echo.^>%*
(%*)
echo.
