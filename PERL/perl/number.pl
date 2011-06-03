$num1="mad",123;
$num1++;
print($num1);	#output is mae


$num1="maz",123;
$num1++;	#here and above output not converted to zero,o
		#only in mul/div
print($num1);	#output is mba


$num1="a";
$num1=$num*4;	#output is converted to 0
print($num1);	#output is 0


$num1=123,"maz";
$num1++;
print $num1;	#output is 124

