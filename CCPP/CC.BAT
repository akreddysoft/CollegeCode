@if exist %1.exe del %1.exe
@if exist %1.obj del %1.obj

@gcc -std=c99 -pedantic -W -Wall -O -o %1 %1.c