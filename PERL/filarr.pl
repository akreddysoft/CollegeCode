  #!/usr/local/bin/perl

  #demonstrates diff methods of opening and displaying file
  
  open(MYFILE, "file1")||die("cannot open file");

##################first method###############333
  print("first method\n");
  @input = <MYFILE>;

  print (@input,"\n");
 

##################last method###############333
  print("last method\n");
seek(MYFILE,0,0);

  @input = <MYFILE>;

  for($i=0;$i<@input;++$i)	#this is very discouraged method,never use index
  {
  	print($input[$i]);
  }
 
############################################
print("\nsecond method\n");
seek(MYFILE,0,0);
$line=<MYFILE>;
while($line ne "")	#If there are no more lines left in MYFILE, $line is assigned the empty string
{
	print($line);
	$line=<MYFILE>;
}
###################BEST METHOD#######################
print("\nthird method\n");		#this is the best method
seek(MYFILE,0,0);
while(<MYFILE>)						
{
	print;     # $_;
	
}
##########################################
print("\n4 method\n");
seek(MYFILE,0,0);
while($line=<MYFILE>)	#cond will break when $line=null string. this is almost sam e as second
{
	print($line);
}

##########################################
print("\n5 method\n");
seek(MYFILE,0,0);
$line=<MYFILE>;
while($line)	#cond will break when $line=null string. this is almost same as above
{
	print($line);
	$line=<MYFILE>;	#but here reading must be done in loop,above it is done in condition
	
}
