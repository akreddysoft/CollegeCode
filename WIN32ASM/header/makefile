MASMPATH=D:\MASM32
ML=ml
DEBUG = 1
!IF $(DEBUG)==1
CFLAGS=/c /coff /Zd /Zi /Fl /Sn /nologo /I $(MASMPATH)\include
!ELSE
CFLAGS=/c /coff /Fl /Sn /nologo /I
!ENDIF
LDFLAGS=
SOURCES=header.asm
RESOURCES=header.rc
OBJECTS=$(SOURCES:.asm=.obj) header.res
PROJ=header.exe


$(PROJ): $(OBJECTS)
	link /NOLOGO /SUBSYSTEM:WINDOWS /LIBPATH:$(MASMPATH)\LIB $(OBJECTS)
	
	
$(OBJECTS): $(SOURCES)
	$(ML) $(CFLAGS) $(SOURCES)
	C:\Borland\BCC55\Bin\brcc32.exe header.rc
	
clean:
	del *.exe
	del *.obj
	del *.lst
	del *.dll
	del *.map
	del *.exp
	del *.lib