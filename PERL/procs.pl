
  #!/usr/local/bin/perl


#In Perl, my and local behave identically and use the same syntax. The only 
#difference between them is that variables created using my are not known outside 
#the subroutine. $total = 0;

  &getnumbers;

  foreach $number (@numbers) {

          $total += $number;

  }

  print ("the total is $total\n");



 sub getnumbers {

         $line = <STDIN>;

         $line =~ s/^\s+|\s*\n$//g;

         @numbers = split(/\s+/, $line);

 } 
# After the array variable @_ has been created, it can be used anywhere any 
# other array variable can be used. This means that you do not need to assign its 
# contents to local variables. 