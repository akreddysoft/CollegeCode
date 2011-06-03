#!/usr/bin/perl
use strict;
use warnings;

my $var=5;
my $ptr=\$var;
#print "$ptr\n$$ptr";

my(@list)=(1,2,4);

$ptr=\@list;
print "\n$ptr";

my $ptr1=\$list[0];	#this address is not same as above
print "\n$ptr1";

foreach my $i($ptr)
{
	print "$i";
}

my %month=(1,"jan",2,"FeB");

my $ptr2=\%month;

foreach my $i (sort keys %$ptr2) 
{

    printf "$i is $$ptr2{$i} \n";

}
my $i=1;

    printf '$$ptr2{$i} is ';

    printf "$$ptr2{$i} \n";

   
    printf '${$ptr2}{$i} is ';

    printf "${$ptr2}{$i} \n";

   
    printf '$ptr2->{$i} is ';

    printf "$ptr2->{$i}\n";


    #printf '${$ptr2{$i}} is ';

    #printf "${$ptr2{$i}} \n";

   
    printf '${$ptr2->{$i}} is ';

   printf "${$ptr2->{$i}}";
