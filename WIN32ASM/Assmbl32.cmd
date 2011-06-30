@echo off
if exist %1.obj del %1.obj
ml /c /coff /Zd /Zi /Fl /Sn /nologo /I %pdrive%\masm32\include %1.asm 
