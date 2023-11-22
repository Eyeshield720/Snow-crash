# Snow-crash - level00


- [x] test to find a password at first and I find something for the flag01 maybe..
- [x] try to find user `flag00` and display the result
```console
~$ cat /etc/passwd | grep flag00
...
flag00:x:3000:3000::/home/flag/flag00:/bin/bash
flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash
...

~$ find / -user flag00 2>/dev/null -> -exec cat {} +
/usr/sbin/john			->	cdiiddwpgswtgt
/rofs/usr/sbin/john		->	cdiiddwpgswtgt
```
* With [dcode](https://www.dcode.fr), you can decrypt this discovery
- [x] after this, let's to do the same in bash
```console
~$ find / -user flag00 2>/dev/null -exec cat {} + | head -n1 | tr "A-Za-z" "L-ZA-Kl-za-k"
nottoohardhere
~$ su flag00
Password: 
Don't forget to launch getflag !
~$ getflag
Check flag.Here is your token : x24ti5gi3x0ol2eh4esiuxias
```
