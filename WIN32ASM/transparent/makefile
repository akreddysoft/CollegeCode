MASMPATH=D:\MASM32
ML=ml
DEBUG = 1
!IF $(DEBUG)==1
CFLAGS=/c /coff /Zd /Zi /Fl /Sn /nologo /I
!ELSE
CFLAGS=/c /coff /Fl /Sn /nologo /I
!ENDIF
LDFLAGS=
SOURCES=trans.asm
OBJECTS=$(SOURCES:.asm=.obj)
PROJ=trans.exe


$(PROJ): $(OBJECTS)
	link /NOLOGO /SUBSYSTEM:WINDOWS /LIBPATH:$(MASMPATH)\LIB $(OBJECTS)
	
$(OBJECTS): $(SOURCES)
	$(ML) $(CFLAGS) $(MASMPATH)\include $(SOURCES) 
	
clean:
	del *.exe
	del *.obj
	del *.lst