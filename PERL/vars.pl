#!/usr/bin/perl
use strict;
use warnings;

our $record=7;

{
	my $record;
	$record=8;
	print("\n$record");
}

print("\n$record");