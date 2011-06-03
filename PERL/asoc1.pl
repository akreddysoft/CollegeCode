
%fruit = ("apples" => 17, "bananas" => 9, "oranges" => "none"); 

foreach $sub (keys(%fruit))
{
	print("$sub $fruit[$sub]\n");	#this wont print vals because curly bracks are not used, but prints sub
	print("$sub $fruit{$sub}\n");	#this wont print vals because curly bracks are not used, but prints sub

	
}