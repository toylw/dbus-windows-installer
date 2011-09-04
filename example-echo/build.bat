@echo off 
call %~dp0\..\env.bat

set CFLAGS=-I"%ProgramFiles%\D-Bus\include" -I.
set LDFLAGS=-L"%ProgramFiles%\D-Bus\bin" -ldbus-c++-1 -ldbus-1 -enable-auto-import
set LIBADD="%ProgramFiles%\D-Bus\bin\pthreadGC2.dll"

dbusxx-xml2cpp echo-introspect.xml --adaptor=echo-server-glue.h
dbusxx-xml2cpp echo-introspect.xml --proxy=echo-client-glue.h

g++ -D_WIN32 %CFLAGS% %LDFLAGS% -o echo-server.exe echo-server.cpp %LIBADD%
g++ -D_WIN32 %CFLAGS% %LDFLAGS% -o echo-client.exe echo-client.cpp %LIBADD%

pause
