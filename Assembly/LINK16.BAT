@echo off
if exist %1.exe del %1.exe
e:\programming\assembly\link.exe  /CODEVIEW /NOLOGO /MAP %1.obj;
if not errorlevel 1 echo "successfully linked:" %1.obj