@echo off
if exist %1.obj del %1.obj
tasm.exe /Zi /z /la /c /m /t %1.asm
if not errorlevel==1 echo "successfully assembled": %1.asm
