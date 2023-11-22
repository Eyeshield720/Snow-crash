# Snow-crash - level02

* This time when I find a `pcap` file
	- PCAP files are data files created using a program. These files contain packet data of a network and are used to analyze the network characteristics. They also contribute to controlling the network traffic and determining network status.
```console
~$ ls -l
total 12
----r--r-- 1 flag02 level02 8302 Aug 30  2015 level02.pcap
```

* Like flag01, need to extract the pcap file to another device
```console
[~/snow-crash/level02]$ scp -P 4242 level02@192.168.56.101:~/level02.pcap .
```

* As for the one before, here need to install [`wireshark`](https://www.wireshark.org)
```console
[~/snow-crash/level02]$ ./wireshark_install.sh
...
wireshark installed !
```

## In wireshark 
* Let's [Following Protocol Streams](https://www.wireshark.org/docs/wsug_html_chunked/ChAdvFollowStreamSection.html) from `level02.pcap`
```
Password: ft_wandr...NDRel.L0L
```
* This password doesn't work, need to go deeper
* Let's switch to hexdump into the TCP Stream
```
000000B9  66                                                 f
000000BA  74                                                 t
000000BB  5f                                                 _
000000BC  77                                                 w
000000BD  61                                                 a
000000BE  6e                                                 n
000000BF  64                                                 d
000000C0  72                                                 r
000000C1  7f                                                 .
000000C2  7f                                                 .
000000C3  7f                                                 .
000000C4  4e                                                 N
000000C5  44                                                 D
000000C6  52                                                 R
000000C7  65                                                 e
000000C8  6c                                                 l
000000C9  7f                                                 .
000000CA  4c                                                 L
000000CB  30                                                 0
000000CC  4c                                                 L
000000CD  0d                                                 .
```
* Hex `7f` corresponding to the non-printable character `DEL` in ASCII, delete them with the characters that follow them, and try the password `ft_waNDReL0L`

```console
~$ su flag02
Password: 
Don't forget to launch getflag !
~$ getflag
Check flag.Here is your token : kooda2puivaav1idi4f57q8iq
```
