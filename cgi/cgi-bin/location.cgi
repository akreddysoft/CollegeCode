#!c:/perl/bin/perl.exe

print("Content-type:text/html\n");
#the ordering of these 2 statements doesnt matter
print("Location:/image.html\n\n");
#note the location is with respect to /
#just writeing image.html,browser will search in cgi-bin 
#directory for the file
#one alternate solution is to use the base tag

#the above file will be loaded in the browser
#the \n must be present to mark the header statement
#if 2 \n are present browser takes it as end of response 
#header and treats next line as data


#print("Location: http://www.yahoo.com\n\n");


# 2 newline must be present to mark end of response header

print("madhur ahuja");