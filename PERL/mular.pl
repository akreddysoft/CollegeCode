
   #!/usr/bin/perl

   #

   # Using Multi-dimensional Array references again

   #

   $line = ['solid', 'black', ['1','2','3', ['4', '5', '6']]];

   print "\$line->[0] = $line->[0] \n";

   print "\$line->[1] = $line->[1] \n";

   print "\$line->[2][0] = $line->[2][0] \n";

   print "\$line->[2][1] = $line->[2][1] \n";

  print "\$line->[2][2] = $line->[2][2] \n";

  print "\$line->[2][3][0] = $line->[2][3][0] \n";

  print "\$line->[2][3][1] = $line->[2][3][1] \n";

  print "\$line->[2][3][2] = $line->[2][3][2] \n";

  print "\n";


