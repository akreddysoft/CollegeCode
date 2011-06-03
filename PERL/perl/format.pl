#Listing 11.1. A program that uses a print format.


  #!/usr/local/bin/perl

  

  $~ = "MYFORMAT";

  write;

  

  format MYFORMAT =

  ===================================

  Here is the text I want to display.

  ===================================
.



