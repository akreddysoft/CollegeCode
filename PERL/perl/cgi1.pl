$in="name=madhur&comment=this+is+great";	#this is cgi like statement

@in = split(/[&;]/,$in);	#there are 2 diff vars in, @in= ("name=madhur","comment=this+is+great")

#For each array variable defined in your program, a variable named $#array, in 
#which array is the name of your array, is also defined. This variable contains 
#the subscript of the last element of the array. For example: 
#
#
#@myarray = ("goodbye", "cruel", "world");
#
#$lastsub = $#myarray;
#	$lastsub=2
  
  foreach $i (0 .. $#in) 	
  {
   # Convert plus's to spaces
   $in[$i] =~ s/\+/ /g;
  
  ($key,$val)=split(/=/,$in[$i]);
  
  # Convert %XX from hex numbers to alphanumeric 
   $key =~ s/%(..)/pack("c",hex($1))/ge; 
   $val =~ s/%(..)/pack("c",hex($1))/ge; 

   # Associate key and value
   $in{$key} .= "\0" if (defined($in{$key})); # \0 is the multiple separator
   $in{$key} .= $val;

}


foreach $val(keys(%in))
{
	print(" $val: $in{$val}\n")	
}
   
