#! /usr/local/bin/perl
 $date = 'date';
 print<<"END"
 HTTP/1.0 204 No Content
 Date: $date
 Server: $SERVER_SOFTWARE
 MIME-version: 1.0

 END
