$a=3;
$b=5;
&swap($a,$b);
print("$a $b\n");
&refswap($a,$b);
print("$a $b\n");
@list=("madhur","ahuja");
#@list1=("is","great");
#&swap1(\@list,\@list1);
#print("@list @list1\n");
#&swap2(\@list,\@list1);
#print("@list @list1\n");
#&modify(\@list);
#print("@list\n");
#&modify1(@list);
print("@list\n");
&modify2(*list);	#what is passed if there is both scaler and array
print("@list\n");
$list="this is a scalar";	#this is not passed bel
&modify2(*list);	#what is passed if there is both scaler and array
print("@list\n");

&modify3(*list);	#what is passed if there is both scaler and array
print("@list\n");	#not it operates on scalar

print("$list\n");

sub swap
{
	local($c,$d)=@_;
	print("in sub before swap:$c $d\n");
	$temp=$c;
	$c=$d;
	$d=$temp;
	print("after swap:$c $d\n");
}

sub refswap
{
	local($c,$d)=@_;
	print("before swap:@_\n");
	$_[0]=$d;
	$_[1]=$c;
	print("after swap:@_\n");
	
}

sub swap1
{
	local($c,$d)=@_;
	print("in sub before swap:@$c @$d\n");
	@temp=@$c;
	@$c=@$d;
	@$d=@temp;
	print("after swap:@$c @$d\n");
}
sub swap2
{
	local($c,$d)=@_;
	print("in sub before swap:@$c @$d\n");
	$temp=$c;
	$c=$d;
	$d=$temp;
	print("after swap:@$c @$d\n");
}

sub modify
{
	local($c)=@_;
	print("in sub before mod:@$c \n");
	push(@$c,"madhur");
	push(@$c,"ahuja");
	print("after mod:@$c\n");
}


sub modify1
{
	local(@c)=@_;
	print("in sub before mod:@c \n");
	push(@c,"madhur");
	push(@c,"ahuja");
	print("after mod:@c\n");
}

sub modify2
{
	local(*c)=@_;
	print("in sub before mod:@c \n");
	push(@c,"madhur");
	push(@c,"ahuja");
	print("after mod:@c\n");
}


sub modify3
{
	local(*c)=@_;
	print("in sub before mod:$c \n");
	$c="this is changed";
	print("after mod:$c\n");
}