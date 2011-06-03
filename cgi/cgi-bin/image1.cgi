#!c:/perl/bin/perl.exe
$root="c:\\site\\programming";
print("content-type:text/html\n\n");


open(MYFILE,"$root\\images\\madhur.jpg") ||print("cannot open file");
print("$root\\images\\madhur.jpg");

while (read(MYFILE,$buffer,16384))
{
print($buffer);
}


sub header
{
	my($title)=@_;
	print("<html>\n");
	print("<head><title>$title</title></head>\n");
	print("<body>\n");
}

sub endhead
{
	print("</body>\n");
	print("</html>\n");
}
