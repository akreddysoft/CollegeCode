@echo off
if exist %1.obj del %1.obj
ml.exe /c /Fl /Sa /Zi /nologo %1.asm
if not errorlevel==1 echo "successfully assembled": %1.asm
