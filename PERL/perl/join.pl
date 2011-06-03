
  #!/usr/local/bin/perl

  #dont know thils is no t working
#
#  @input = <STDIN>;
#
#  chop (@input);
#
#  $string = join(" ", @input);
#
#  print ("$string\n");


$string=join(" ",2,3);
print($string,"\n");

$string = "words::separated::by::colons";

@array = split(/::/, $string);
print("\n$string");
print("\n@array");