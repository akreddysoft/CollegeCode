#!/usr/bin/perl
use strict;
use warnings;

open MYFILE,"d:\\madhur\\guests.txt" or die("cannot open file");
my @comments=map {<MYFILE>}(1..5);
print "@comments";
close MYFILE;
