#If a string contains characters that are not digits, the string is converted to 0 when used in an integer context. For example: 
#$result = "hello" * 5; 
## this assigns 0 to $result, since "hello" becomes 0 
#This is true even if the string is a valid hexadecimal integer if the quotes are removed, as in the following:
#$result = "0xff" + 1; 
#In cases like this, Perl does not tell you that anything has gone wrong, and your results might not be what you expect.
#Also, strings containing misprints might not contain what you expect. For example:
#$result = "12O34"; # the letter O, not the number 0 
#When converting from a string to an integer, Perl starts at the left and continues until it sees a letter that is not a digit. In the preceding instance, 12O34 is converted to the integer 12, not 12034 

$numchar="m";
$numchar++;
print($numchar);	#out will be n
####################


$numchar="z";
$numchar++;
print("\n$numchar");	#out will be aa


$numchar="d";
$numchar--;
print("\n$numchar");	#out is -1


$numchar="m";
$numchar=$numchar+5;	# -1 and 5 will be concatenated
print("\n$numchar");	#out will be -15
####################

$numchar=43;
$numchar=$numchar+"mddhur";
print("\n$numchar");	#out will be 43
####################


$result = $undefined + 2;   # $undefined is not defined

print ("The value of \$result is $result.\n");

#############################