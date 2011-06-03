#include df.cdf
$temp="name=madhur&comment=its+bad&another=%32";	#this is like query info string
@pairs=split(/&/,$temp);	#("name=madhur","comment=its+bad")

foreach $item(@pairs) 
{

	($key,$content)=split (/=/,$item);	#key=name,$content=madhur,key=comment,content=its+bad

	print("$key:$content\n");
	
	$content=~tr/+/ /;			#content=its bad

	print("$key:$content\n");

	$content=~ s/%(..)/pack("c",hex($1))/ge;

	$fields{$key}=$content;			#fields{name}=madhur, fields{comment}=its bad

}



print "$fields{'name'}\n";

print "$fields{'comment'}\n";