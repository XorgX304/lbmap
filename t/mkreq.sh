#!/bin/sh
# Generates request files

# First remove old files
rm cases/*
# HTTP 0.9 requests
echo -ne " \r\n\r\n" > cases/01 
echo -ne "OPTIONS #\r\n\r\n" > cases/02
echo -ne "OPTIONS * HTTP/1.0\r\n\r\n" > cases/03
echo -ne "OPTIONS / HTTP/1.0\r\n\r\n" > cases/04

# HTTP 1.0 requests
echo -ne "12345 GET / HTTP/1.0\r\n\r\n" > cases/10
echo -ne "12345 / HTTP/1.0\r\n\r\n" > cases/11
echo -ne "%47%45%54 / HTTP/1.0\r\n\r\n" > cases/12
echo -ne "%47ET / HTTP/1.0\r\n\r\n" > cases/13

# HTTP/1.1 requests
perl -e 'print "GET / HTTP/1.1\r\nHost: testtest\r\nConnection: Close"."\r\nX-Head: abcdesdds" x 10 ."\r\n\r\n";' > cases/20
perl -e 'print "GET / HTTP/1.1\r\nHost: testtest\r\nConnection: Close"."\r\nX-Head: abcdesdds" x 70 ."\r\n\r\n";' > cases/21
perl -e 'print "GET / HTTP/1.1\r\nHost: testtest\r\nConnection: Close"."\r\nX-Head: a" x 70 ."\r\n\r\n";' > cases/22
perl -e 'print "GET / HTTP/1.1\r\nHost: testtest\r\nConnection: Close"."\r\nX-Head: abcdesdds" x 102 ."\r\n\r\n";' > cases/23
perl -e 'print "GET / HTTP/1.1\r\nHost: testtest\r\nConnection: Close"."\r\nX-Head: abcdesdds" x 405 ."\r\n\r\n";' > cases/24
perl -e 'print "GET / HTTP/1.1\r\nHost: testtest\r\nConnection: Close\r\nX-Head: "."A" x  5000 ."\r\n\r\n";' > cases/25
perl -e 'print "GET / HTTP/1.1\r\nHost: testtest\r\nConnection: Close\r\nX-Head: "."A" x  20000 ."\r\n\r\n";' > cases/26

# Malformed requests
echo -ne "ALL YOUR BASE ARE BELONG TO US\r\n\r\n" > cases/50

exit
        "GET ~" > 
        "GET /" > 
        "GET" > 
        "GET\0/\0HTTP/1.0" > 
        "GET / \0 HTTP/1.0" > 
        "GET \0 / HTTP/1.0" > 
        "GET \1 HTTP/1.0" > 
        "GET%20/ HTTP/1.0" > 
        "GET %2f HTTP/1.0" > 
        "GET %2F HTTP/1.0" > 
        "GET /?abc=%GG HTTP/1.0" > 
        "GET C:\ HTTP/1.0" > 
        "GET / FTP/1.0" > 
        "GET FTP://asdfasdf HTTP/1.0" > 
        "GET GET GET" > 
        "GET / H" > 
        "GET / HHTP/1.0" > 
        "GET / hhtp/999.99" > 
        "GET / HHTP/999.99" > 
        "GET / HTP/1.0" > 
        "GET / HTTP/" > 
        "GET / HTTP/0.9" > 
        "GET / HTTP / 1" > 
        "GET / HTTP/1." > 
        "get / http;/1.0" > 
        "Get / HTTP/1.0" > 
        '""GET / HTTP/1.0',
        '"GET / HTTP/1.0',
        '"GET / HTTP/1.0\"',
        '"GET" / HTTP/1.0',
        'GET "/" HTTP/1.0',
        " GET / HTTP/1.0" > 
        "G E T / HTTP/1.0" > 
        "GET `/` HTTP/1.0" > 
        "GET       /       HTTP/1.0" > 
        "GET ! HTTP/1.0" > 
        "GET ? HTTP/1.0" > 
        "GET / HTTP /1.0" > 
        "GET / HTTP/1,0" > 
        "GET / HTTP/1.0" > 
        "GET // HTTP/1.0" > 
        "GET /HTTP/1.0" > 
        "GET . HTTP/1.0" > 
        "GET '/' HTTP/1.0" > 
        "GET \ HTTP/1.0" > 
        "GET \"/\" HTTP/1.0" > 
        "GET/ HTTP/1.0" > 
        "GET/HTTP /1.0" > 
        "GET/HTTP/1 .0" > 
        "GET/HTTP/1. 0" > 
        "GET/HTTP/1.0 " > 
        "GET/HTTP/1.0" > 
        "GET / HTTP/1.0\0" > 
        "GET / HTTP/1.0\n\n" > 
        "GET / HTTP/1.0\r\nContent-Length: 2000000000000000000000000000000000000000" > 
        "GET / HTTP/1.0\r\nDate: -1" > 
        "GET / HTTP/1.0\r\nExpect: 100-continue" > 
        "GET / HTTP/1.0\r\nMax-Forwards: 0" > 
        "GET / HTTP/1.0\r\nX-Bad header here" > 
        "GET / HTTP/1.0 X" > 
        "GET / HTTP/1.0X" > 
        "GET / ".'HTTP/1.'.'0' x 1000,
        "GET / HTTP/1.0" . ' ' x 1000,
        "GET / HTTP/1.1.0" > 
        "GET / HTTP/1.10" > 
        "GET / HTTP/1.1\r\nHost: localhost" > 
        "GET / HTTP/1.1\r\nHost: localhost\r\nUpgrade: TLS/1.0, HTTP/1.1" > 
        "GET / HTTP/-1.1\r\nHost: lunch" > 
        "GET / HTTP/1.1\r\n\r\nHost: localhost" > 
        "GET / HTTP/1.1\r\nUpgrade: HTTP/1.0" > 
	"GET / HTTP/1.0\r\nLong-Header: " . 'A' x 1000,
	"GET / HTTP/1.0\r\nLong-Header: " . 'A' x 5000,
	"GET / HTTP/1.0\r\nLong-Header: " . 'A' x 9001,
	"GET / HTTP/1.0" . "\r\nX-a: b" x 10,
        "GET / HTTP/1.2" > 
        "GET / HTTP/1.X" > 
        "GET / ".'HTTP/'.'1' x 1000 .'.0',
        "GET / ".'HTTP/1'.'.' x 1000 .'0',
        "GET / HTTP/2.1" > 
        "GET / http/999.99" > 
        "GET / HTTP/999.99" > 
        "GET / HTTP/9.Q" > 
        "GET / HTTP/FF.DD\r\nHost: lunch" > 
        "GET / HTTP/Q.9" > 
        "GET / HTTP/Q.Q" > 
        "GET http://www.somehost.com/path/file.html HTTP/1.2" > 
        "GET http://www.somehost.com/path/file.html HTTP/1.2\r\nHost: www.somehost.com" > 
        "GET / ".'HTTP'.'/' x 1000 .'1.0',
        "GET / ".'H' x 1000 .'TTP/1.0',
        "GET / index.html HTTP/1.0" > 
        "GET index.html HTTP/1.0" > 
        "GET /kjsadkjsadkfjaslfjasljdisjadfijqfakckljdkl HTTP/1.0" > 
        "GETS /index.php" > 
        "GET\t/\tHTTP/1.0" > 
        "GET /".' ' x 1000 .'HTTP/1.0',
        "GET ".'/' x 1000 . ' HTTP/1.0',
        "GET".' ' x 1000 . '/ HTTP/1.0',
        "GEX\bT / HTTP/1.0" > 
        "HEAD /" > 
        "HEAD /asdfasdfasdfasdfasdf/.. HTTP/1.0" > 
        "HEAD /asdfasdfasdfasdfasdf/../ HTTP/1.0" > 
        "HEAD h HTTP/1.0" > 
        "HEAD / HQWERTY/1.0" > 
        "HEAD * HTTP/0.1" > 
        "Head / HTTP/1.0" > 
        " HEAD / HTTP/1.0" > 
        "HEAD / HTTP/1.0" > 
        "HEAD ///////////// HTTP/1.0" > 
        "HEAD /./././././././././././././././ HTTP/1.0" > 
        "HEAD /.. HTTP/1.0" > 
        "HEAD /../ HTTP/1.0" > 
        "HEAD /../../../../../ HTTP/1.0" > 
        "HEAD /.\\ HTTP/1.0" > 
        "HEAD .. HTTP/1.0" > 
        "HEAD http HTTP/1.0" > 
        "HEAD http: HTTP/1.0" > 
        "HEAD http:/ HTTP/1.0" > 
        "HEAD http:// HTTP/1.0" > 
        "HEAD HTTP://qwerty.asdfg.com/ HTTP/1.0" > 
        "HEAD /././././././qwerty/.././././././././ HTTP/1.0" > 
        "HEAD SHOULDERS KNEES AND TOES" > 
        "HEAD\t/\tHTTP/1.0" > 
        "HELLO" > 
        "HTTP/1.0 / GET" > 
        " \nHEAD / HTTP/1.0" > 
        "\nHEAD / HTTP/1.0" > 
        "OPTIONS /" > 
        "OPTIONS / HTTP/1.0" > 
        "OPTIONS * HTTP/1.0" > 
        "OPTIONS / VERB" > 
        "OPTIONS #VERB" > 
        "PING / PONG" > 
        "POST /" > 
        "POST / HTTP/1.0" > 
        "POST / HTTP/1.0\r\nContent-Length: 1000000000000000000000000000000000000000" > 
        "PUT /" > 
        "PUT / HTTP/1.0" > 
        "\r\n" x 1000 . 'GET / HTTP/1.0',
        "TRACE /" > 
        "TRACE / HTTP/1.0" > 
        "TRACK /" > 
        "TRACK / HTTP/1.0" > 
        " " x 1000,
        "/" x 1000,
        " " x 1000 . 'GET / HTTP/1.0',
