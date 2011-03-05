@echo off 

set MINGW_PATH=D:\Mat\kderoot\mingw
set DBUS_PATH="C:\Program Files\D-Bus"

set PATH=%PATH%;%MINGW_PATH%\bin
set PATH=%PATH%;%DBUS_PATH%\bin


dbusxx-xml2cpp echo-introspect.xml --adaptor=echo-server-glue.h
dbusxx-xml2cpp echo-introspect.xml --proxy=echo-client-glue.h

g++ -D_WIN32 -I. -I%DBUS_PATH%\include -o echo-server.exe echo-server.cpp libdbus-c++-1.dll 
g++ -D_WIN32 -I. -I%DBUS_PATH%\include -o echo-client.exe echo-client.cpp libdbus-c++-1.dll 
pause
