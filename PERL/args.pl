@args=<>;  	#get command line args

print($args[0]);
print($args[1]);
print($args[2]);
print($args[3]);


$numarg=@args;
print("\nnumber of args: $numarg");
$numarg=@ARGV;

print("\nnumber of args: $numarg");
print("\n name of program : $0");	#use of system variable
#while ($inputline = <>) 
#{
#
#     print ($inputline);
#
# }
#
