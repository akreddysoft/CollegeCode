#!c:/perl/bin/perl.exe -w

print("content type:dfdsf\n\n");

print("<html>");	#this tag must be given to enable tag like strong

$count=%ENV;
$temp=$ENV{'HTTP_USER_AGENT'};
print("<p>Your browser is: <b>$temp</b>\n");
print("<br>Number of variables are:$count\n");
print("<p><h3>Other environment variables are:</h3>\n");

print("<table height=100% border=1 width=100%");


foreach $valdata(keys(%ENV))
{
	print("<tr>");
	print("<td>");
	print("<p><strong>$valdata :</strong>");
	print("</td>");
	
	print("<td>");
	print("<p>$ENV{$valdata}");
	print("</td>");

}

print("</html>");