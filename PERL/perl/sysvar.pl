#!c:/perl/bin/perl.exe

#By default, the pattern-matching operator examines the value stored in $_. This 
#means that you can leave out the =~ operator if you are searching $_: 


print ("hi") if ($_ =~ /abc/);

print ("hi") if (/abc/);         # these two are the same



$_ = "This string contains the number 25.11.";

@array = /(-?(\d+)\.?(\d+))/;	#the parenthesis are neccessar for $1 and $2

print($1 $2);	#this is automatically assigned,but not working
print("@array\n");
