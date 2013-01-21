@echo off
rem -------------------
rem SETTINGS
rem Change settings here.
rem -------------------

rem Max memory program can use. In some cases seting this
rem to a higher value can improve speed.
set MAX_MEM="512m"

rem -------------------
rem CORE
rem Don't change stuff below unless
rem you know what you're doing...
rem -------------------

rem If running in Take Command (4NT), force to run in cmd.exe
if not "%@eval[2+2]" == "4" goto normalstart
cmd /C %0 %*
goto finish

:normalstart
set _PERCENT=%%
set _EXCLAMATION=!
setlocal enabledelayedexpansion

set JYTHON_CMD="%CD%\.jython\jython.bat"
set JAVA_LIB="%CD%\.lib\java"
set PYTHON_PATH=

for /R "%CD%\.lib\java" %%a in (*.jar) do (
    set CLASSPATH=!CLASSPATH!;%%a
)

echo starting...

%JYTHON_CMD% -J-Xmx%MAX_MEM% -Dpython.path="%CD%\.lib\python" -m entrypoint
