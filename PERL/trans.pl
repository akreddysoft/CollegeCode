$temp="name=madhur&comment=its+bad&another=120";	#this is like query info string
@pairs=split(/&/,$temp);	#("name=madhur","comment=its+bad")

foreach $item(@pairs) 
{

($key,$content)=split (/=/,$item);	#key=name,$content=madhur,key=comment,content=its+bad
print("$key:$content\n");

$temp1=$content;
$temp1=~tr/+/ /;			#content=its bad
print("$key:$temp1\n");


$temp1=$content;
$temp1=~s/\+/ /;			#content=its bad
print("$key:$temp1\n");
}



$temp1="madhur ahuja";
$temp1=~tr/ma/MA/;
print("$temp1\n");