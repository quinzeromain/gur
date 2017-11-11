@echo off

set currentDir=%~dp0
set MyDate=%date:~10,4%%date:~4,2%%date:~7,2%
set MyTime=%time:~0,2%%time:~3,2%%time:~6,2%
if "%MyTime~0,1%"==" " set MyTime = 0%MyTime:~1%
set pathlog=%currentDir%_logs\gur-%MyDate%%MyTime%.txt

if "%1"=="-clean" GOTO CleanUpLogs
if "%1"=="-h" GOTO Help
if "%1"=="" (
	set configfile=%currentDir%repositories.txt
) else (
	set configfile=%1
)
if not exist %configfile% GOTO Error

:Main
if not exist %currentDir%_logs mkdir %currentDir%_logs

echo.

echo Up-to-date the local git repositories on %date% %time%
echo Up-to-date the local git repositories on %date% %time% >> %pathlog%

echo.
echo. >> %pathlog%

for /f "tokens=*" %%a in (%configfile%) do (
	call bin\run-git-update.cmd %%a %pathlog%
	cd %currentDir%
	@echo off
)

echo.
pause
GOTO End

:CleanUpLogs
cd %currentDir%_logs
del /F /Q *.*
cd %currentDir%
echo Cleaning the logs directory up is done.
GOTO End

:Help
echo.
echo Usage : gur [-clean] [-h] ^<config^>
echo Up-to-date the local git repositories according to the config file. 
echo By default the config file, config.txt, is defined at the same directory to this tool.
echo.
echo Parameters :
echo ^<config^>   : an absolute ^path of the config file 
echo -clean     : clean the logs directory
echo -h         : display this help
echo.
pause
GOTO End

:Error
echo The config file, %configfile%, was not found. Please create it.
GOTO End

:End
@echo on