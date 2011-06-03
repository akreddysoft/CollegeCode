#!c:/perl/bin/perl.exe

$temp=$ENV{'QUERY_STRING'};	#name=madhur&comment=its+bad

@pairs=split(/&/,$temp);	#("name=madhur","comment=its+bad")

foreach $item(@pairs) 
{

	($key,$content)=split (/=/,$item,2);	#key=name,$content=madhur,key=comment,content=its+bad

	$content=~tr/+/ /;			#content=its bad

	$content=~ s/%(..)/pack("c",hex($1))/ge;

	$fields{$key}=$content;			#fields{name}=madhur, fields{comment}=its bad

}

print "Content-type: text/html\n\n";

print "<body bgcolor=\"#FFFFFF\">\n";

print "<h2>$fields{'name'}</h2>\n";

print "<pre>$fields{'comment'}</pre>\n";

