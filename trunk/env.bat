@echo off 
set ROOT=%~dp0\..\
call %ROOT%\kderoot\emerge\etc\kdesettings.bat

REM set PATH=c:\Program Files\D-Bus\bin;%PATH%

set PATH=%PATH%;%KDEROOT%\bin
set PATH=%PATH%;%KDEROOT%\mingw\bin
set PATH=%PATH%;C:\Program Files\NSIS
set PATH=%PATH%;%KDEROOT%\emerge\bin
set PATH=%PATH%;%KDEROOT%\dev-utils\bin
