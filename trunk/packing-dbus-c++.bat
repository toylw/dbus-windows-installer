@echo off 
call %~dp0\env.bat

time /t
python "packing-dbus-c++.py" %*
time /t

pause
