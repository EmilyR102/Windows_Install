setlocal enabledelayedexpansion
@echo off

cls

set process[0]=a
set process[1]=b
set process[2]=c

rem if you had quotes around the value, it will echo those quotes too

set old_count=0
echo %old_count%



@REM EnableDelayedExpansion adds an additional syntax to expand variables: !var!.
@REM The percent expansion %var% is still availabe and isn't changed by the delayed expansion.
@REM The delayed expansion of !var! is done when the expression is executed, in spite of %var%, that will be expanded in the moment of parsing (complete code blocks), before any of the commands in the blocks are executed.

rem set currentProcess=!processes[%lastCompleted%+1]!
echo the following should be b

rem /a evaluates the arithmetic expression
set /a "new_count=%old_count%+1"
set currentProcess=!process[%new_count%]!
echo !currentProcess!

rem "!patchFolderPath!\!currentProcess!"
echo the following should be a/b/c
echo "!process[0]!/!process[1]!/!process[2]!"

echo the following should be #1:b
echo Running process #%new_count%:!currentProcess!

@echo on

set "patchFolderPath=C:\Dell Lattitude E7450 Patches Test"
set process[3]=dummy.bat
set currentProcess=!process[3]!
echo "!patchFolderPath!\!currentProcess!"

rem start /wait !patchFolderPath!\!currentProcess!
echo Testing start order
set "currentProcessPath=!patchFolderPath!\!currentProcess!"
echo currentProcessPath:
echo "!currentProcessPath!"

rem USE Call instead of START!! Start doesn't do variables

call "!currentProcessPath!"

rem https://stackoverflow.com/questions/17201507/how-to-use-the-start-command-in-a-batch-file
rem https://ss64.com/nt/start.html

rem START "title" [/D path] [options] "command" [parameters]

@REM start !currentProcess! /D "!currentProcessPath!"

