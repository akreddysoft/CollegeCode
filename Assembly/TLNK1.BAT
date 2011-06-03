@echo off
if exist %1.exe del %1.exe
h:\tasm\bin\tlink.exe /m /s /l /3 %1
if not errorlevel 1 echo "successfully linked:" %1.obj