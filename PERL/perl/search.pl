#program to extract the pathnames from the file
print("Enter the filename:");
$file=<stdin>;
#$file="lnk132.bat";

open(FILEVAR,$file) || die("\nError Opening file");

@fileout=split(/\./,$file);
open(OUTFILE,">$fileout[0].txt") || die("\nerror");

@line = <FILEVAR>;		#assign whole file to a

$pattern='[c-jC-J]:\\\[_a-zA-Z0-9\\\]+';

$i=0;
while($i<@line)
{
	if($line[$i]=~/$pattern/)
	{
		@matches=$line[$i]=~/$pattern/g;
		print OUTFILE ("@matches\n");
		
	}
	
	++$i;
	
}

close(FILEVAR);
close(OUTFILE);
