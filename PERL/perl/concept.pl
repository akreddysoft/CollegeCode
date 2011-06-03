
  #!/usr/bin/perl

  #

  # Using Array references

  #

  $pointer = \@ARGV;

  printf "\n Pointer Address of ARGV = $pointer\n";

  $i = scalar(@$pointer);
  $i = @$pointer;		#even this works,above for clarity,this is like type casting @($pointer)

  
  printf "\n Number of arguments : $i \n";


  for($j=0;$j<$i;++$j)
  {
  	print("value: $$pointer[$j] Address: $pointer[$j]\n");	#second stat wont print address of ind element
  	
  }
  $i=0;
  foreach (@$pointer)
   {

      printf "$i : $$pointer[$i++]; \n";

      }


