#!c:/perl/bin/perl.exe

$root="h:\\programs\\cgi";
print("Content-type:text/html\n\n");
#the ordering of these 2 statements doesnt matter

#open function of perl will not accept virtual pathnames 
#so actual pathname must be provided
#this is done using a variable holding the statiic path
open(MYFILE,"$root\\image.html")||print("cannot open file");
$line=<MYFILE>;
while($line ne "")
{
	print($line);
	$line=<MYFILE>;
	#chop($line);
}
#here the problem is of path,html file will require absolute path
#names to work, because theis method changes relative pathnames

#not a good solution

