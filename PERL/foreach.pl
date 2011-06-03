#testing foreach
use warnings;


$ar[1]=5;
$ar[5]=10;
$ar[10]="Dfdsf";
#not that ar[2]--ar[4] will be null string ,same will be for 6-9
#these null string will be also printed in output

foreach my $value (@ar)
{
	print("$value\n");	#since 2,3,4 are defined,perl will warn 
}



#call to a special built-in function, keys. This function returns a list 
#consisting of the subscripts of the associative array; the foreach statement 
#then loops through this list, iterating once for each element of the associative 
#array
print("DFdfs");

################################################################
$ar1{1}=5;
$ar1{5}=10;
$ar1{10}="Dfdsf";
#print($ar1{2});
foreach $subscript (keys(%ar1))
{
	print("$subscript $ar1{$subscript}\n"); 	#now foreach prints only the vals for whilch subscripts are defined
	#keys doesnt work with non associative arrays
	
}

###############################################################


my @array=qw(the quick brown fox jumps over the lazy dog);	#this is a list

for (1,3,5,7)	
{
	print($array[$_]);
}
print("\n");
#this is same as 
my @df=(1,3,5,7);
for (@df)	
{
	print($array[$_]);
}
#and same as
print("\n");

for my $i (@df)		#this is the best method
{
	print($array[$i]);
}
print("\n");
#################################################################
#$_ sysvar is a alias for an array value ,if its val is changed original list is changed

my @num=(1,2,3,4,5);
for (@num)
{
	$_=$_ - 1;
}

print(@num);
###############################################################
#but constant will not change
for (1,2,3,4,5)	#perl will flag error
{
	$_=$_ - 1;
}
 