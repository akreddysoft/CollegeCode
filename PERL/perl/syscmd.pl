#also shows different methods 
$command="dir";

$result=`$command`;

#print($result);

#########################

$command="dir";

@result=`$command`;

foreach $i(0..$#result)
{
print($result[$i]);
}

