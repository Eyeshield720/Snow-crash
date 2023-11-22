# Snow-crash - level09
## Find something
```bash
level09@SnowCrash:~$ ls
level09  token
```
* On exec of level09, he binary seems to increment the value of each character following the order
```bash
level09@SnowCrash:~$ ./level09
You need to provied only one arg.
level09@SnowCrash:~$ ./level09 token
tpmhr
level09@SnowCrash:~$ ./level09 AAAAA
ABCDE
```
* Read file token
```bash
level09@SnowCrash:~$ cat token
f4kmm6p|=�p�n��DB�Du{��
```
* We try to restore the original string by decreasing
```bash
scp -P 4242 level09/Ressources/level09.c level09@192.168.56.101:/tmp/level09.c
cd /tmp; gcc /tmp/level09.c -o /tmp/level09.out; bash -c "/tmp/level09.out /home/user/level09/token /tmp/level09.txt"; cat /tmp/level09.txt

```
* At this point we have the token
```bash
f3iji1ju5yuevaus41q1afiuq
```
* Getflag
```bash
level09@SnowCrash:/tmp$ su flag09
Password: 
Don't forget to launch getflag !
flag09@SnowCrash:~$ getflag
Check flag.Here is your token : s5cAJpM8ev6XHw998pRWG728z
```