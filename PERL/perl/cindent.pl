#program to indent c file

print("Enter the filename:");
#$file=<stdin>;
$file="key.c";

open(FILEVAR,$file) || die("\nError Opening file");

@fileout=split(/\./,$file);
open(OUTFILE,">$fileout[0].txt") || die("\nerror");

@line = <FILEVAR>;		#assign whole file to a
$i=0;
$j=0;
$indent=0;
$temp=0;
while($i<@line)
{
	
	#while($i<@line)
	#{
		$line[$i]=~s/^[\t ]+//;
	#	print OUTFILE ($line[$i]);
	#	$i++;
	#}
	print($line[$i]);

	
	$temp=0;
	while($temp<$indent)
	{
		if($line[$i]!=~/^}/)
		{
			print OUTFILE ("\t");
			++$temp;
		}
		else
		{
			--$indent;
			++$temp;
		}
	}
	
	print OUTFILE ($line[$i]);
	
	
	
	
	if($line[$i]=~/^{/)
	{
		++$indent;
		print("true");
	}
	
	if($line[$i]=~/^}/)
	{
		--$indent;
		print("false");
		
	
	}
		
	
	
	++$i;

		

}

close(FILEVAR);
close(OUTFILE);
	
