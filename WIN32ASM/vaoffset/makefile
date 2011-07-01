MASMPATH=D:\MASM32
ML=ml
DEBUG = 1
!IF $(DEBUG)==1
CFLAGS=/c /coff /Zd /Zi /Fl /Sn /nologo /I
!ELSE
CFLAGS=/c /coff /Fl /Sn /nologo /I
!ENDIF
LDFLAGS=
SOURCES=vaoffset.asm
RESOURCES=vaoffset.rc
OBJECTS=$(SOURCES:.asm=.obj) vaoffset.res
PROJ=vaoffset.exe


$(PROJ): $(OBJECTS)
	link /NOLOGO /SUBSYSTEM:WINDOWS /LIBPATH:$(MASMPATH)\LIB /LIBPATH:D:\projects\programs\winsock\netsend $(OBJECTS)
	
$(OBJECTS): $(SOURCES)
	$(ML) $(CFLAGS) $(MASMPATH)\include $(SOURCES) 
	C:\Borland\BCC55\Bin\brcc32.exe vaoffset.rc
	
	
clean:
	del *.exe
	del *.obj
	del *.lst