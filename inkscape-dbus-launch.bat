@echo off 
call %~dp0\env.bat

%KDEROOT%\devel\inkscape-devel\inkscape\inkscape\inkscape.exe 2>&1
