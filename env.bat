@echo off 
set ROOT=%~dp0\..\
call %ROOT%\kderoot\emerge\etc\kdesettings.bat

set PATH=%KDEROOT%\bin;%PATH%
set PATH=%KDEROOT%\mingw\bin;%PATH%
set PATH=%KDEROOT%\emerge\bin;%PATH%
set PATH=%KDEROOT%\dev-utils\bin;%PATH%
set PATH=K:\NSIS;%PATH%
set PATH=C:\Program Files\NSIS;%PATH%

REM Set default editor for svn commit
set EDITOR=notepad
