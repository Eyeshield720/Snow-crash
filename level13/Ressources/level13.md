# Snow-crash - level03

* An binary as find in the home directory
```console
level13@SnowCrash:~$ ls -l
total 8
-rwsr-sr-x 1 flag13 level13 7303 Aug 30  2015 level13
```
* We try to run the binary, which asks to be uid 4242
```console
level13@SnowCrash:~$ ./level13
UID 2013 started us but we we expect 4242
```
* Use `nm`, see the functions called
```console
level13@SnowCrash:~$ nm level13
         U exit@@GLIBC_2.0
08048450 t frame_dummy
08048474 T ft_des
         U getuid@@GLIBC_2.0
0804858c T main
         U printf@@GLIBC_2.0
         U strdup@@GLIBC_2.0
```

* `getuid` is called
* Let's overwrite the uid fetch by `getuid` to 4242 with gdb
```console
level13@SnowCrash:~$ gdb level13
```
```console
(gdb) b getuid
Breakpoint 1 at 0x8048380
(gdb) r
Starting program: /home/user/level13/level13
(gdb) s
Single stepping until exit from function getuid,
(gdb) p $eax
$1 = 2013
(gdb) set $eax=4242
(gdb) c
Continuing.
your token is 2A31L79asukciNyi8uppkEuSx
```