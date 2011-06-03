@echo off
if exist %1.com del %1.com
copy %1.exe temp.exe
execom %1
ren temp.exe %2.exe