open (MESSAGE, "| mail dave");     # the contents of message will be piped to mail dave
				   #  i.e. it becomes mail dave < Message

print MESSAGE ("Hi, Dave!  Your Perl program sent this!\n");

close (MESSAGE);
