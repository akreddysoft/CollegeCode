#!/usr/local/bin/perl

# document root defined here
$root = 'c:/site/programming';

open(FILE,"$root/programming.html") || die "Cannot open file.\n";
while (<FILE>) {
  print;
} 
