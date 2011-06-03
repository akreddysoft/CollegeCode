del *.com
del *.exe
del *.lst
del *.map
del *.obj
del *.t*
del *.nms       
del *.sym	 
del *.pif	
del *.dbg	 
rem del *.sts
ren link.bin link.exe
copy link.exe link.bin
ren execom.bin execom.com
copy execom.com execom.bin