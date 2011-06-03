#!/usr/bin/perl
use warnings;
use strict;
my ($MAILFILE,$dir,$line,@words,@header,$i,@message);

$dir="/var/spool/mail/madhur";
open($MAILFILE,$dir)||die "Unable to open file\n";
$i=0;
my($flag,$flag1,$m);
$m=0;
while(<$MAILFILE>)
{	
		@words=split(/ /);
		if($words[0] eq "From")
		{
		while(<$MAILFILE> && $words[0] ne "To:")
		{
			$header[$i++]=$_;
			@words=split(/ /);	
			print $_;
		}
		}
	
		if($words[0] eq "To:")
		{
		while(<$MAILFILE> && $words[0] ne "From")
		{
			$message[$m++]=$_;
			@words=split(/ /);
			print $_;
		}
		}
	

}

print @header;
print @message;
close $MAILFILE;
