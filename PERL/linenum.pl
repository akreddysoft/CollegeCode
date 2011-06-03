$file=$ARGV[0];
open(MYFILE,"$file");
@input=<MYFILE>;
$i=0;
while($i<=@input)	#filename will be automatically taken from the command line
{
	if($input[$i]=~/^[0-9]+:/)
	{
		$input[$i]=~s/^[0-9]+:[ ]//;
	}
	print("$input[$i]");
	$i++;
}
close(MYFILE);
