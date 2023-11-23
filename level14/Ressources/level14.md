# Snow-crash - level14

* No binary found in the home directory
```console
level14@SnowCrash:~$ ls -l
```
* Use `nm`, see the functions called in `/bin/getflag`
```console
level14@SnowCrash:~$ nm /bin/getflag
         U getuid@@GLIBC_2.0
         U ptrace@@GLIBC_2.0
```

* `getuid` is called
* Let's overwrite the uid fetch by `getuid` to 3014 with gdb
```console
level14@SnowCrash:~$ gdb /bin/getflag
(gdb) b getuid
Breakpoint 1 at 0x80484b0
(gdb) r
Starting program: /bin/getflag 
You should not reverse this
[Inferior 1 (process 3502) exited with code 01]
```
* `/bin/getflag` detects we are in gdb thanks to ptrace, so we overwrite the result of ptrace too
```console
(gdb) b ptrace
Breakpoint 2 at 0xb7f146d0
(gdb) r
Starting program: /bin/getflag
Breakpoint 2, 0xb7f146d0 in ptrace () from /lib/i386-linux-gnu/libc.so.6
(gdb) s
Single stepping until exit from function ptrace,
(gdb) p $eax
$1 = -1
(gdb) set $eax=0
(gdb) c
Continuing.

Breakpoint 1, 0xb7ee4cc0 in getuid () from /lib/i386-linux-gnu/libc.so.6
(gdb) s
Single stepping until exit from function getuid,
(gdb) set $eax=3014
(gdb) c
Continuing.
Check flag.Here is your token : 7QiHafiNa3HVozsaXkawuYrTstxbpABHD8CPnHJ
[Inferior 1 (process 3511) exited normally]
```