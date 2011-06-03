@echo off
if exist %1.exe del %1.exe
if exist %1.com del %1.com
e:\tasm\bin\tlink.exe /t /m /s /l /3 %1
if not errorlevel 1 echo "successfully linked:" %1.obj