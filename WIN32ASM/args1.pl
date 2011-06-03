#this file is for those who have files with same %1
#see args2 for those who have different filenames


$file=$ARGV[0];			#argv must be caps, this is the name of file
$debug=$ARGV[1];		# this is boolean whether to include debug or not,optional
				# val not provided means 0=debug will be provided

system("Assmbl32.bat $file");

if($debug==0)
{
	$link=' /NOLOGO /DEBUG /DEBUGTYPE:CV /PDB:NONE /MAP /LIBPATH:h:\MASM32\LIB';
}
else
{
	print("\ndebug not provided\n");
	$link=' /NOLOGO /LIBPATH:h:\MASM32\LIB';
}
	

if(!-e $file.".asm")
{
	die("\nthere is no asm file");
}

if(-e $file.".hook")
{
	print("\nthere is hook file");
	$link=$link." /SECTION:.bss,S";
	
}

if(-e $file.".console")
{
	print("\nthere is console file");
	$link=$link.' /SUBSYSTEM:CONSOLE';
	
}
else
{
	$link=$link.' /SUBSYSTEM:WINDOWS';
}
	

if(-e $file.".def")
{
	print("\nthere is def file");
	$link=$link." /DLL /DEF:$file.def /MAPINFO:EXPORTS";
}
else
{
	$link=$link." /MAPINFO:LINES";
}
	

$link=$link." $file.obj";


if(-e $file.".rc")
{
	print("\nthere is rc file\n");
	print("brcc32 $file.rc\n");
	system("brcc32 $file.rc");
	if(-e $file.".res")
	{
		$link=$link." $file.res";
	}
	else
	{
		die("\n rc did not compile successfully");
	}

}
else
{
	if(-e $file.".res")
	{
		print("\nthere is res file");
		$link=$link." $file.res";

		
	}
}


print("\nh:\\masm32\\bin\\link $link\n");
#system("h:\\masm32\\bin\\link $link");
open(LINKPIPE,"h:\\masm32\\bin\\link $link |");
@data=<LINKPIPE>;
print(@data);