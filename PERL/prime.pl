#program to print the prime numbers
$count=2;
while($count<100)
{
	$i=2;

	while($i<$count)
	{
		if($count%$i==0)
		{
			$flag=0;
			break;
		}
		else
		{
			$flag=1;
		}
		$i++;
	}
	
	if(flag)
	{
		print("\n$count");
	}
	$count++;
}
		