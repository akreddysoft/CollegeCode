  #!/usr/local/bin/perl

  

  print ("Ask me a question politely:\n");

  #$question = <STDIN>;

  if ($question =~ /please/) {

          print ("Thank you for being polite!\n");

  } else {

          print ("That was not very polite!\n");

  }
  
#  #A word is assumed to contain letters, digits, and underscore characters, and 
#  nothing else. This means that #/\bdef/ #matches $defghi: because $ is not 
#  assumed to be part of a word, def is the beginning of the word defghi, and 
#  /\bdef/ matches it. 
  
  
  $line="abcdef defabc" ;
  if($line=~/def/)
  {
	print("1");  	
  }
  if($line=~/\bdef/)
  {
  	print("2");
}

if($line=~/^def/)
  {
  	print("3");
}

