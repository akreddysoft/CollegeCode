@echo off
rem this is the link for final release

if exist %1.lst del %1.lst
if exist %1.exe del %1.exe
if exist %1.map del %1.map
rem if exist %1.dll del %1.dll
if exist %1.lib del %1.lib
if exist %1.exp del %1.exp
if exist %1.res del %1.res

if exist %1.console goto console
if exist %1.def goto dll
if exist %1.rc goto rc
if exist %1.res goto res
if exist %1.hook goto hook


:noresrc
%pdrive%\masm32\bin\Link /NOLOGO /SUBSYSTEM:WINDOWS /LIBPATH:%pdrive%\MASM32\LIB %1.obj
echo "warning:no resource found"
goto TheEnd

:rc
c:\bc5\bin\brcc32.exe %1.rc
%pdrive%\masm32\bin\Link /NOLOGO /SUBSYSTEM:WINDOWS /LIBPATH:%pdrive%\MASM32\LIB %1.obj %1.res
echo "resource compiled and processed"
goto TheEnd


:res
%pdrive%\masm32\bin\Link /NOLOGO /SUBSYSTEM:WINDOWS /LIBPATH:%pdrive%\MASM32\LIB %1.obj %1.res
echo "resource processed"
goto TheEnd


:dll
if exist %1.rc goto rcdll
%pdrive%\masm32\bin\Link /NOLOGO /DLL /DEF:%1.def /SUBSYSTEM:WINDOWS /LIBPATH:%pdrive%\MASM32\LIB %1.obj
echo "dll compiled"
goto TheEnd

:hook
%pdrive%\masm32\bin\Link /NOLOGO /SECTION:.bss,S /DLL /DEF:%1.def /SUBSYSTEM:WINDOWS /LIBPATH:%pdrive%\MASM32\LIB %1.obj
echo "hook dll compiled"
goto TheEnd

:console
%pdrive%\masm32\bin\Link /NOLOGO /SUBSYSTEM:CONSOLE /LIBPATH:%pdrive%\MASM32\LIB %1.obj
echo "console program"
goto TheEnd

:rcdll
c:\bc5\bin\brcc32.exe %1.rc
%pdrive%\masm32\bin\Link /NOLOGO /DLL /DEF:%1.def /SUBSYSTEM:WINDOWS /LIBPATH:%pdrive%\MASM32\LIB %1.obj %1.res
echo "dll with resource compiled"
goto TheEnd
:TheEnd


:TheEnd
if exist %1.obj del %1.obj
if exist %1.res del %1.res
if exist %1.exp del %1.exp
if exist %1.lib del %1.lib