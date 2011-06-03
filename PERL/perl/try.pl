$root="c:\\site\\programming";

open(MYFILE,"$root\\programming.htm")||print("cannot open file");
$line=<MYFILE>;
print("$root\\programming.htm");
while($line ne "")
{
	print($line);
	$line=<MYFILE>;
	chop($line);
}
