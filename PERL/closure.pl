#Listing 18.8. Using closures.


#!/usr/bin/perl


sub errorMsg {

         my $lvl = shift;

        #

        # define the subroutine to run when called.

        #

         return sub 
         {



        my $msg = shift;  # Define the error type now.

        print "Err Level $lvl:$msg\n"; }; # print later.

         }



$severe  = errorMsg("Severe");

$fatal = errorMsg("Fatal");

$annoy = errorMsg("Annoying");



&$severe("Divide by zero");

&$fatal("Did you forget to use a semi-colon?");

&$annoy("Uninitialized variable in use");


