$content="%41 %42 %30";
$content=~ s/%(..)/pack("c",hex($1))/ge;
print($content);
