@echo off

if "%1"=="-h" GOTO Help
if "%1"=="" GOTO Help
if "%2"=="" GOTO Help
if "%3"=="" GOTO Help

echo **** Local Git Repository: %1 ****

echo **** Local Git Repository: %1 **** >> %3
cd %1
git checkout %2 >> %3
echo. >> %3
git pull >> %3
echo. >> %3
echo. >> %3
GOTO End

:Help
echo.
echo Usage: run-update [-h] ^<path^> ^<branch^> ^<logpath^>
echo Up-to-date a local git repository according to the ^path and the branch.
echo.
echo Parameters :
echo ^<path^>    : absolute ^path of the git repository
echo ^<branch^>  : branch to up-to-date
echo ^<logpath^> : absolute ^path of the log file
echo -h          : display this help
echo.
GOTO End

:End
@echo on