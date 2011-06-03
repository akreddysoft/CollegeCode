  #!/usr/local/bin/perl



  while (1) {

          &readaline;

          last if ($line eq "");

          sub readaline {

                  $line = <STDIN>;

          }

          print ($line);

 }

 print ("done\n");
