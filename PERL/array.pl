@array = (1, 2, 3, 4);
$scalar = $array[4]; 
print($scalar);
print("\n");
#Here, $array[4] refers to the fifth element of @array, which does not exist. In this case, $scalar is assigned the null string. 
@array={1,2,3,4,5};
$array1=$array[1];
print("outputting\n");
print($array,"dd\n");
print(@array,"de\n");
print(@array[2],"df\n");
print($array[3],"dg\n");
print($array1,"\n");
$array1 = @array;
print($array1);
##################################