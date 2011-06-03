@echo off

if exist %1.exe del %1.exe
if exist %1.map del %1.map
if exist %1.dll del %1.dll
if exist %1.lib del %1.lib
if exist %1.exp del %1.exp
if exist %1.res del %1.res

if exist %1.console goto console
if exist %1.rc goto rc
if exist %1.res goto res
if exist %1.hook goto hook
if exist %1.def goto dll

:noresrc
h:\masm32\bin\Link /NOLOGO /SUBSYSTEM:WINDOWS /map /MAPINFO:LINES /LIBPATH:h:\MASM32\LIB %1.obj
echo "warning:no resource found"
goto TheEnd

:rc
c:\bc5\bin\brcc32.exe %1.rc
h:\masm32\bin\Link /NOLOGO /SUBSYSTEM:WINDOWS /map /MAPINFO:LINES /LIBPATH:h:\MASM32\LIB %1.obj %1.res
echo "resource compiled and processed"
goto TheEnd


:res
h:\masm32\bin\Link /NOLOGO /SUBSYSTEM:WINDOWS /map /MAPINFO:LINES /LIBPATH:h:\MASM32\LIB %1.obj %1.res
echo "resource processed"
goto TheEnd


:dll
h:\masm32\bin\Link /NOLOGO /DLL /DEF:%1.def /SUBSYSTEM:WINDOWS /map /MAPINFO:LINES /LIBPATH:h:\MASM32\LIB %1.obj
echo "dll compiled"
goto TheEnd

:hook
h:\masm32\bin\Link /NOLOGO /SECTION:.bss,S /DLL /DEF:%1.def /SUBSYSTEM:WINDOWS /map /MAPINFO:LINES /LIBPATH:h:\MASM32\LIB %1.obj
echo "hook dll compiled"
goto TheEnd

:console
h:\masm32\bin\Link /NOLOGO /DEBUG /PDB:NONE /SUBSYSTEM:CONSOLE /map /MAPINFO:LINES /LIBPATH:h:\MASM32\LIB %1.obj
echo "console program"
:TheEnd


:TheEnd

