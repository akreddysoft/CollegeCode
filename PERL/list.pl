  #!/usr/local/bin/perl

  

  @array = (1, "chicken", 1.23, "\"Having fun?\"", 9.33e+23);

  $count = 1;

  while ($count <= 5) {

          print ("element $count is $array[$count-1]\n");

          $count++;

  }


 @list=(1,2,3,$list[0]);
 print(@list);
 #######################
 
 @array = (1, 2, 3);

print ("@array\n");


@array=("madhur","ahuja","is","a","good",23);
print(@array);	#this will not print length, but will print list without spaces
print("\n@array");

#############################
@array = (1, 2, 3);

$scalar = @array;

print("\nlength is:$scalar");

#It is always important to remember that $scalar and ($scalar) are not the same 
#thing. $scalar is a scalar variable, and ($scalar) is a one-element list 
#containing $scalar

$scalar = (10, 20, 30,40); 
print($scalar);