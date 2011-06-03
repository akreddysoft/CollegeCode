#PROGRAM TO COUNT THE WORDS IN THE INPUT


#read this
#The pattern / / tells split to start a new word whenever it sees a space


$line=<stdin>;
chop($line);
$num=0;
while($line ne "")
{
	
		
	@list=split(/[\t ]+/,$line);	#list contains list of words
	$num=@list+$num;
	$line=<stdin>;
	
}
print("\n length is :$num");

##################################################