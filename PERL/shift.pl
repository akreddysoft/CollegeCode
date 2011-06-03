@list=("madhur","ahuja","is","good");
while(@list)	#this loops till no of elements
{
	print("@list\n");
	$num=@list;
	print("number of elements are $num\n");
	shift(@list);		#this reduces number of elements by 1,if this is not given there is infinite loop;

}
########################################

@list=("madhur","","ahuja","is","good");
while(@list)	
{
	print("@list\n");
	shift(@list);
}