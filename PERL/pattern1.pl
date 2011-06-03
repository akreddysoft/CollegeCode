
  #!/usr/local/bin/perl

  

  while ("balata" =~ /.a/g) {

          $match = $&;
	  #$off=pos("balata");
          print ("$match $off\n");

  }


