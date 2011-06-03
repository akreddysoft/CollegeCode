#!c:/perl/bin/perl.exe

require 'cgi-lib.pl';

print("content-type:text/html\n\n");
&ReadParse(*input);
print(%input);

print(@input);


foreach $name (keys(%input)) 
{
   foreach (split("\0", $in{$name}))
    {
      ($value = $_) =~ s/\n/<br>\n/g; 
      print "<dt><b>$name</b>\n"; 
      print "<dd><i>$value</i><br>\n"; 
   }
}

