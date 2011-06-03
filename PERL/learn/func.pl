
#!/usr/bin/perl
use strict;
use warnings;

#PROGRAM THAT DETERMINES THE CALLING CONVENTION OF SUBROUTINES

#my $a=2,$b=5;

#&swap($a,$b);

#print "\n$a $b";

my @list=(1,2,3);
#&diff(@list);	#this call modifies the list
#print "\n@list";
#&diff1(@list);
#print "\n@list";

&diff2(*list);
print "\n@list";

sub swap
{
	my ($c,$d,$temp)=@_;
	print "\nvalue in subroutine $c $d";
	$temp=$c;
	$c=$d;
	$d=$temp;
}
	
	
sub diff
{
	
	$_[0]=3;
	$_[1]=2;
	$_[2]=1;
	
	
	
}	


sub diff1
{
	
	my(@list1)=@_;

	$list1[0]=3;
	$list1[1]=2;
	$list1[2]=1;
}


sub diff2
{
	local(*list2)=@_;
	@list2=(3,2,1);	
}

	
