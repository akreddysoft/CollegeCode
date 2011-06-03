#!c:/perl/bin/perl.exe

require cgi-lib.pl
sub wait_for_lock
{
	my($lockf)=@_;
	while(-e $lockf)
	{
		sleep 3;
	}
	open(LOCKFILE,">$lockf");
	close(LOCKFILE);
	
}


sub	signal_lock
{
	unlink($lockf);
}




sub print_form()
{
  print("<h1>Add Entry to Guestbook</h1>");
  print("<hr>\n");
  print("<form method=POST>\n");
  print("<p>Enter your name:\n");
  print("<input type=text name=\"name\" size=25><br>\n");
  print("<p>Enter your e-mail address:\n"); 
  print("<input type=text name=\"email\" size=35><br>\n");
  print("<p>Enter your WWW home page:\n"); 
  print("<input type=text name=\"url\" size=35></p>\n");
  print("<p>Enter your comments:<br>\n"); 
  print("<textarea name=\"message\" rows=5 cols=60>\n");
  print("</textarea></p>\n"); 
  print("<input type=submit value=\"Submit comments\">\n");
  print("<input type=reset value=\"Clear form\">\n");
  print("</form>\n<hr>\n");
}

sub print_thanks()
{
  h1("Thanks!");
  print("<p>We've added your comments. Thanks!</p>\n");
}




sub header
{
	my($title)=@_;
	print("Content-type:text/html\n\n");
	print("<html>\n");
	print("<head><title>$title</title></head>\n");
	print("<body>\n");
}

sub endhead
{
	print("</body>\n");
	print("</html>\n");
}

sub append(char *fname, char *name, char *email, char *url, char *message)
{
  local(*fname,*name,*email,*url,*message)=@_;
  $lockfile="lock1.txt";	#this  is the global variable  

  wait_for_lock($lockfile);
  if(-e $fname)
  {
  	
  	
  	
  }
  if (!file_exist(fname)) {
   guestfile = fopen(fname,"w");
   print_header(guestfile);
  }
  else {
   if ((guestfile = fopen(fname,"a")) == NULL) {
    unlock_file(LOCKFILE
    cgi_error();
);
   }
  }
  fprintf(guestfile,"<p><b>From:</b> ");
  if (strcmp(url,""))
   fprintf(guestfile,"<a href=\"%s\">",url); 
  fprintf(guestfile,"%s\n",name);
  if (strcmp(url,""))
   fprintf(guestfile,"</a>\n"); 
  if (strcmp(email,""))
   fprintf(guestfile,"<a href=\"mailto:%s\">&lt;%s&gt;</a>\n",email,email); 
  fprintf(guestfile,"<br>");
  fprintf(guestfile,"<b>Posted on:</b> %s</p>\n",date_and_time());
  fprintf(guestfile,"<pre>\n%s</pre>\n",message); 
  fprintf(guestfile,"<hr>\n");
  unlock_file(LOCKFILE);
  fclose(guestfile);
}



##################################################################


$res=&ReadParse(*input);
if($res==0)
{
	&header("Madhur's GuestBook");
	&print_form;
	