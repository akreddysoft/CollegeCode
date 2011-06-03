$inputline = <STDIN>;
print( $inputline );
$x="madhur";
print($x,"\n");
chop($x);
print($x);

###############################

$line=34;
print($line+2);
print($line & "df");	#this is bitwise anding of 36 and "df" converted to 0 so the result is zero

print($line | "df");	#this is oring,result is 34 ( 34 or 0)


print(5|10);	#ansewr is 15


print("\nllok:",$anyvar)       #shows the init value of unititlalised variable
