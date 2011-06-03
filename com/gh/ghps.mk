
ghps.dll: dlldata.obj gh_p.obj gh_i.obj
	link /dll /out:ghps.dll /def:ghps.def /entry:DllMain dlldata.obj gh_p.obj gh_i.obj \
		kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib oleaut32.lib uuid.lib \

.c.obj:
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x0400 /DREGISTER_PROXY_DLL \
		$<

clean:
	@del ghps.dll
	@del ghps.lib
	@del ghps.exp
	@del dlldata.obj
	@del gh_p.obj
	@del gh_i.obj
