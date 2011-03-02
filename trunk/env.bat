@echo off 
set ROOT=%~dp0\..\
call %ROOT%\kderoot\emerge\etc\kdesettings.bat

set PATH=%KDEROOT%\bin;%PATH%
set PATH=%KDEROOT%\mingw\bin;%PATH%
set PATH=%KDEROOT%\emerge\bin;%PATH%
set PATH=%KDEROOT%\dev-utils\bin;%PATH%
set PATH=K:\NSIS;%PATH%
