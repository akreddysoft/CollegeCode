#this program demonstrates command line arguments handling


print("no arguments\n") if($ARGV[0] eq "");	#first method if there are args or not
die("no arguments\n") if(@ARGV == 0);		#sefond method : check the length of the list

$num=@ARGV;
print("your arguments are:@ARGV and count is $num\n");
################################################
foreach $value (@ARGV)
{
	print("$value is a file\n") if(-e "$value");
	print("$value is a directory\n") if(-d "$value");
}
############first method of disp all files###################################
$list=<>;	#opens the first argument as file,and reads the first line
		#must ensure that args are files,unless output prints error
		#this checking can be done in program also using above method
		
while($list)	#Because the null string is equivalent to false in a conditional expression, there is no need to use a conditional operator such as ne. 

{
	print($list);		#this will print file contents of all arguments
	$list=<>;
	#can contain more useful processing
}



#When it reaches the end of the last file on the command line, the <> operator 
#returns the empty string. However, if you use the <> operator after it has 
#returned the empty string, the Perl interpreter assumes that you want to start 
#reading input from the standard input file. (Recall that <> reads from the 
#standard input file if there are no files on the command line.) 

#############second method to disp all files#############################
#but how to rewind the file pointer?
@array=<>;	#this now just waits for input on stdin
print(@array);
####################################################
