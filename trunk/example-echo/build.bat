@echo off 
call %~dp0\..\env.bat

set CFLAGS=-I"%ProgramFiles%\D-Bus\include" -I. -DHAVE_STRUCT_TIMESPEC=1 
set LDFLAGS=-L"%ProgramFiles%\D-Bus\bin" -ldbus-c++-1 -ldbus-1 -lpthreads -enable-auto-import -static-libgcc 

dbusxx-xml2cpp echo-introspect.xml --adaptor=echo-server-glue.h
dbusxx-xml2cpp echo-introspect.xml --proxy=echo-client-glue.h

g++ -D_WIN32 %CFLAGS% %LDFLAGS% -o echo-server.exe echo-server.cpp
g++ -D_WIN32 %CFLAGS% %LDFLAGS% -o echo-client.exe echo-client.cpp

pause
