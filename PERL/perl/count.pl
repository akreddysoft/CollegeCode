1:  #!/usr/local/bin/perl

2:  

3:  print ("Specify the nonblank characters you want to count:\n");

4:  $countstring = <STDIN>;

5:  chop ($countstring);

6:  @chars = split (/\s*/, $countstring);

7:  while ($input = <>) {

8:          $_ = $input;

9:          foreach $char (@chars) {

10:                 eval ("\$count = tr/$char/$char/;");

11:                 $count{$char} += $count;

12:         }

13: }

14: foreach $char (sort (@chars)) {

15:         print ("$char appears $count{$char} times\n");

16: }


