#clear examples on pointers

$x=sub {madhur};
&$x;

$ref=&mysub("madhur");

&$ref("ahuja");





sub madhur
{
	print("\nThis is a sub statement");
}


sub mysub
{
	my(@list)=@_;
	
	print(@list);
	
	
	return sub 			#this returns a pointer to this sub
	{
		local(@list1)=@_;
		my(@list)=@_;
		print("\nthis @list\n");
		print("\nthat @list1\n");
	}
	
}