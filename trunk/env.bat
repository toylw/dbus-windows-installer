@echo off 
set ROOT=%~dp0\..\
call %ROOT%\kderoot\etc\kdesettings.bat

set PATH=%KDEROOT%\bin;%PATH%
set PATH=%KDEROOT%\mingw\bin;%PATH%
set PATH=%KDEROOT%\emerge\bin;%PATH%
set PATH=%KDEROOT%\dev-utils\bin;%PATH%
set PATH=%ProgramFiles%\NSIS;%PATH%
set PATH=%ProgramFiles%\python32;%PATH%
set PATH=C:\python32;%PATH%

REM Set default editor for svn commit
set EDITOR=notepad
