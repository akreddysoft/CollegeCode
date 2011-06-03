$newstring = "potato" . "head";		#string concatenation
print($newstring);
print("\n");
#####################################	
$newstring = "t" x 5;
print($newstring);			#string repetion

####################################
$mystring="madhur",0,"ahuja";	#printed string  iwll be madhur
print("\n",$mystring);
$mystring="madhur",1;		#printed string  iwll be madhur
print("\n",$mystring);
###############################
$num=10;
print("\nthis is a $num\n");
print('\nThis is a $num');            #no place for special chars, vars are not expanded
###############################
$logo="madhur ahuja";
	
	
$logo1='madhur ahuja 			
	fdfds dskf ds';			#can spread over multiple lines
	
print("\n $logo");
print("\n $logo1");
