#!e:/perl/bin/perl.exe
use strict;
use warnings;

my $text="this is a line of text\n".
	 "entered by madhur\n".
	 "again a line of text";
$text=~tr/"\n"/~/;

	 
print $text;