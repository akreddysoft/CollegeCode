#!c:/perl/bin/perl.exe
use strict;
use warnings;

##my $madhur;
our $madhur;

$madhur="madhur ah";

print($madhur,"\n");

&ad;

sub ad
{
	our $madhur="Ab";
	print($madhur,"\n");
}
	
