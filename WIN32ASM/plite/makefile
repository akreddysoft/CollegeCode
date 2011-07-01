MASMPATH=D:\MASM32
ML=ml
DEBUG = 1
!IF $(DEBUG)==1
CFLAGS=/c /coff /Zd /Zi /Fl /Sn /nologo /I $(MASMPATH)\include
!ELSE
CFLAGS=/c /coff /Fl /Sn /nologo /I
!ENDIF
LDFLAGS=
SOURCES=revealer.asm
RESOURCES=revealer.rc
OBJECTS=$(SOURCES:.asm=.obj) revealer.res
PROJ=revealer.exe


$(PROJ): $(OBJECTS) password.lib password.dll
	link /NOLOGO /SUBSYSTEM:WINDOWS /LIBPATH:$(MASMPATH)\LIB $(OBJECTS) password.lib
	
	
password.lib password.dll: password.asm password.def	
	link /DLL /DEF:password.def /SUBSYSTEM:WINDOWS /map /MAPINFO:LINES /LIBPATH:$(MASMPATH)\LIB password.obj 	

$(OBJECTS): $(SOURCES)
	$(ML) $(CFLAGS) $(SOURCES) password.asm
	C:\Borland\BCC55\Bin\brcc32.exe revealer.rc
	
clean:
	del *.exe
	del *.obj
	del *.lst
	del *.dll
	del *.map
	del *.exp
	del *.lib