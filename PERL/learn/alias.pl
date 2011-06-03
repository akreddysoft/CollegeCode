
  #!/usr/local/bin/perl
#se strict;
#use warnings;

  @foo = ("here's", "a", "list");

  &testsub (*foo);

  print "\nmadhur: @foo";


  sub testsub {

          local (*printarray) = @_;

         foreach $element (@printarray) {

                 print ("aa: $element\n");

         }
	@printarray=("madhur","ahuja");

 }


