@echo off 
REM call %~dp0\..\emerge\etc\kdesettings.bat

dbus-send --print-reply --dest=im.pidgin.plugin.dbus /im/pidgin/plugin/dbus inkboard.pidgin.dbus.newTalk string:'inkboard'
pause

dbus-send --print-reply --dest=im.pidgin.plugin.dbus /im/pidgin/plugin/dbus inkboard.pidgin.dbus.getContact int32:1
pause

dbus-send --print-reply --dest=im.pidgin.plugin.dbus /im/pidgin/plugin/dbus inkboard.pidgin.dbus.sendMessage int32:1 string:'hihihi'
pause
