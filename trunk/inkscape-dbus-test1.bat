@echo off 
call %~dp0\env.bat

dbus-send --print-reply --dest=org.inkscape.inkdbus /org/inkscape/inkdbus org.inkscape.dbus.listDocuments
pause

dbus-send --print-reply --dest=org.inkscape.inkdbus /org/inkscape/inkdbus org.freedesktop.DBus.Introspectable.Introspect
pause
