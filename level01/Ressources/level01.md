# Snow-crash - level01

* At first, retry to check the passwd file
* That works again but the password doesn't works
```console
~$ cat /etc/passwd | grep flag01
flag01:42hDRfypTqqnw:3001:3001::/home/flag/flag01:/bin/bash
```

* Now need to extract the passwd file on the host device for usse [JTR](https://github.com/openwall/john)
```console
[~/snow-crash/level01]$ scp -P 4242 level01@192.168.56.101:/etc/passwd .
```

* If your device is on an OS like Kali/BlackArch you can use john directly, but here it's ubuntu
```console
[~/snow-crash/level01]$ ./install_john
...
Make process completed.
[~/snow-crash/level01]$ ./john-1.9.0-jumbo-1/run/john passwd --show
flag01:abcdefg:3001:3001::/home/flag/flag01:/bin/bash

1 password hash cracked, 0 left
```

* Let's try this password
```console
~$ su flag01
Password: 
Don't forget to launch getflag !
~$ getflag
Check flag.Here is your token : f2av5il02puano7naaf6adaaf
```
