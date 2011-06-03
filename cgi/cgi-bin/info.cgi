#!c:/perl/bin/perl.exe

print("content-type:text/html\n\n");

$time = (localtime);
&header("this is the title passed as arguent");
print("<b>the time is: $time<b>");
&endhead;



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
