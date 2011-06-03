#!c:/perl/bin/perl.exe

require 'cgi-lib.pl';

&ReadParse(*input);
print &PrintHeader,&HtmlTop("Query Results"),"<dl>\n"; 
print &PrintHeader,&HtmlTop("Query Results"),&PrintVariables(%input),&HtmlBot; 

