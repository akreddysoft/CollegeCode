#demonstrates redirection of i/o
$line=<stdin>;
print($line);		#this will print if only not redirected
print stderr ($line);	#this prints on screen even if redirected using >
	