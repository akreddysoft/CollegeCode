#!/usr/bin/perl
use warnings;
use strict;

my(@result,$i);
#different methods of displaying list variables
########first method#######
@result=("madhur","ahuja","\n","is","a","","great");

print(@result,"\n");

######second method#########

#print($#result);		#this is relative to 0 i.e. 6
foreach $i(0..$#result)	#i will take val from 0 to $#result->length of result
{
print($result[$i]);

}
#if(defined($i))
#{
#	print("$i is defined");		#i was local to the foreach,it will not be printed
#					#if it was previously defined,its value is preserved
#}
#print("\n");
##########third method######

while(@result)
{
	print($result[0]);
	shift(@result);		#this will destroy the list
}
print("\n");
#######################
@result=("madhur","ahuja","\n","is","a","","great");
for($i=0;$i<=$#result;++$i)
{
	print($result[$i]);
}
print("\n");

####################################
#for($i..$#result)
#{
#	print($result[$i]);
#}
##################################
for(@result)
{
print;
}
##################################
print("\n");
#while(@result)
#{
#print;
#}
##################################
for my $i(0..$#result)
{
print($result[$i]);
}
print("\n");
####################
for(0..$#result)	#this is the best method
{
	print($result[$_]);
}
