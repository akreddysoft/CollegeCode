#!/usr/bin/perl
use strict;
use warnings;

my %in=("madhur","ahuja","mayank","aggarwal");

foreach my $temp(keys(%in))
{
	print "$temp -> $in{$temp}\n";
}

&readparse(*in);


foreach my $temp(keys(%in))
{
	print "$temp -> $in{$temp}\n";
}





sub readparse
{
	my (*input)=@_;
	%input=("vibhav","mohan","tanuj","narang");
}