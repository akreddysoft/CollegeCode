#!/usr/bin/perl

if ($#ARGV == -1) {
   &print_form;
}
else {
   &print_results(@ARGV);
}

sub print_form {
   print <<EOM;
Content-Type: text/html

<html> <head>
<title>Search Fake Database</title>
<isindex>
</head>

<body>
<h1>Search Fake Database</h1>

<p>This program pretends to search a database for the keywords you enter.
It uses the ISINDEX tag to receive user input.

</body> </html>
EOM
}

sub print_results {
   local(@keywords) = @_;

   print <<EOM;
Content-Type: text/html

<html> <head>
<title>Search results</title>
</head>

<body>
<h1>Search results</h1>

<p>You entered the following keywords:
<ul>
EOM
   foreach (@keywords) {
      print " <li>$_\n"; 
   }
   print <<EOM;
</ul>

<p>Had this been a real database search program, you could have
inserted code that would have searched a database for the keywords 
you specified.

</body> </html>
EOM
} 
