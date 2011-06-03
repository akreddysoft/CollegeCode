@echo off
rem if exist %1.obj del %1.obj automatically deletes
if exist e:\school\ueout\%1.exe del e:\school\ueout\%1.exe
E:\TC\BIN\Tcc.exe -v -y -M -lsvl -ne:\school\ueout %1.c