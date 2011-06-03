$first=5,'d';
$second="5",4;
$third='5','5';

if($first==$second)
{
print('first is true\n');
}

if($second==$third)
{
print("second is true\n");
}

if($first==$third)
{
printf("third is true\n");
}

#all above are true
############################

$first=5;
$second="5";
$third='6';
$forth="6";
if($first==$second)
{
print('first1 is true\n');
}

if($second==$third)
{
print("second1 is true\n");	#why this not true
}

if($first==$third)
{
print("third1 is true\n");
}

if($second==$forth)
{
print("forth1 is true\n");
}

if($third==$forth)	#0==0?
{
print("fifth1 is true\n");
}

#first 1 and fifth1 are true

############################

$first=5;
$second="a";
$third='b';
$forth="b";
if($first==$second)
{
print('first2 is true\n');
}

if($second==$third) 	#both converted to 0=0
{
print("second2 is true\n");
}

if($first==$third)	# 	5==0?
{
print("third2 is true\n");
}

if($second==$forth)	#both converted to 0
{
print("forth2 is true\n");
}

if($third==$forth)	#both converted to 0
{
print("fifth2 is true\n");
}


#here second2,forth2,fifth2 is true
#################################33
$var1 = "string 1";

$var2 = "string 2";

$result = $var1 == $var2;   # this statement is bad

if($var1==$var2)
{
        print("this is true\n");
}
#this comes out to be true because both are converted to 0

###############################################
$stringvar = "aBC";

$stringvar++;
print($stringvar);