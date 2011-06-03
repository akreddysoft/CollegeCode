#!c:/perl/bin/perl.exe
# nameage.cgi
require 'cgi-lib.pl';

$input="name=madhur&age=34";
&ReadParse(*input);
print "Content-Type: text/html\r\n\r\n";
print "<html> <head>\n";
print "<title>Name and Age</title>\n";
print "</head>\n";
print "<body>\n";
print "Hello, " . $input{'name'} . ". You are\n"; 
print $input{'age'} . " years old.<p>\n";
print "</body> </html>\n"; 
