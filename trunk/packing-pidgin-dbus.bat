@echo off 
call %~dp0\env.bat

time /t
python "packing-pidgin-dbus.py" %*
time /t

pause
