#!/usr/local/bin/perl
#use strict;
use warnings;


 my @foo = ("here's", "a", "list");

  &testsub (*foo);

	print "\n ss: @foo";
	

  sub testsub 
  {

          local (*printarray) = @_;
          
          foreach my $element (@printarray) 
          {

                 print ("df : $element\n");

         }


	@printarray=("madhur ahuja is great");
 }


