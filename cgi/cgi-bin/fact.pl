#!c:/perl/bin/perl.exe
#program to find the factorial of a number
 print "Content-type:text/html\r\n\r\n";
print("Enter the number:");
#$num=<stdin>;            
$fact=1;
while($num!=0)
{
	$fact=$fact*$num;
	$num--;
}
print "The factorial is $fact";       #it disp max val of !170


