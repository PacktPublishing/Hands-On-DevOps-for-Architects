# Bob Aiello
## ansible-prep show the steps we took to prepare our ansible environment

### We verified the version of Ubuntu running
```
vagrant@ansctl: /etc$ cat lsb-release
DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=12.04
DISTRIB_CODENAME=precise
DISTRIB_DESCRIPTION="Ubuntu 12.04.5 LTS"

vagrant@ansctl: /etc$ lsb_release -cd
Description:    Ubuntu 12.04.5 LTS
Codename:       precise
vagrant@web:/etc$ exit
logout
Connection to 127.0.0.1 closed.
```
### Then we install ansible on ansctl

```
$ sudo apt-get update
$ sudo apt-get install software-properties-common
$ sudo apt-add-repository ppa:ansible/ansible
$ sudo apt-get update
$ sudo apt-get install ansible
```

### We created ssh keys and then copied to both servers

```
vagrant@ansctl:~/ansible_work$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/vagrant/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/vagrant/.ssh/id_rsa.
Your public key has been saved in /home/vagrant/.ssh/id_rsa.pub.
The key fingerprint is:
01:c4:2d:a1:8b:72:77:2d:50:1a:55:65:cf:65:d6:29 vagrant@ansctl
The key's randomart image is:
+--[ RSA 2048]----+
|    .+*+..o   +..|
|     =o... o E ..|
|    +  ..   o .  |
|   . o . .       |
|. o o o S        |
| o . . .         |
|                 |
|                 |
|                 |
+-----------------+
```

### You will want to update /etc/hosts with the IP address and name of the host
```
agrant@ansctl:~/ansible_work$ cat /etc/hosts
127.0.1.1       ansctl  ansctl
127.0.0.1 localhost
192.168.100.100 ansctl
192.168.100.101 web
```

### Then you can copy the shared keys to the servers that ansible should accessing

```
vagrant@ansctl:~/ansible_work$ ssh-copy-id web
The authenticity of host 'web (192.168.100.101)' can't be established.
ECDSA key fingerprint is dc:db:44:40:88:ab:34:d8:0f:40:b6:3d:1a:da:94:b7.
Are you sure you want to continue connecting (yes/no)? yes
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
vagrant@web's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'web'"
and check to make sure that only the key(s) you wanted were added.

```


