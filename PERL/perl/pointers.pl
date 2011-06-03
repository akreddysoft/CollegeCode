
$variable = 22;

$pointer = \$variable;

$ice = "jello";

$iceptr = \$ice;


$value = 10;

$pointer = \$value;


$undefined=\$undefined1;

print "\nAdress:$pointer\n";
print "\nValue: $$pointer\n";

print ("\nAddress: $undefined");		#it has valid address
print ("\nValue: $$undefined");	#nullstring
