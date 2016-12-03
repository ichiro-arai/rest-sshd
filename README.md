# rest-sshd
Example implementation of REST API Server using sshd.

I implemented the idea of the following article:
- [Why aren’t we using SSH for everything? – The Startup – Medium](https://medium.com/swlh/ssh-how-does-it-even-9e43586e4ffc)


## Install

Execute the following command to install `rest-sshd`.

```Shell
$ git clone .../rest-sshd.git
$ cd rest-sshd
$ sudo sh install.sh
$ find /opt/rest-sshd/ -type f
/opt/rest-sshd/example/handler.sh
/opt/rest-sshd/example/usr1.txt
/opt/rest-sshd/example/usr2.txt
/opt/rest-sshd/example/grp2.jpg
/opt/rest-sshd/rest_sshd_config
```


## Start REST API server of sshd

Execute the following command to start sshd REST API server.

```Shell
$ sudo /usr/sbin/sshd -p 16039 -f /opt/rest-sshd/rest_sshd_config 
```


## Connect to REST API server

For example, execute the following command in a client host.

```Shell
$ ssh -p 16039 username@rest-sshd-host GET text
```


## Test

### Preparation
Execute the following in the rest-api-host.

```Shell
$ sudo groupadd grp1
$ sudo groupadd grp2
$ sudo useradd -g grp1 usr1
$ sudo useradd -g grp2 usr2
$ sudo passwd usr1
## enter password
$ sudo passwd usr2
## enter password
```


### Connection test

Execute the following in a client host.

```Shell
$ ssh -p 16039 usr1@rest-sshd-host GET text
 → user1 file.
$ ssh -p 16039 usr2@rest-sshd-host GET text
→ user2 file
$ ssh -p 16039 usr2@rest-sshd-host GET no_such_type
no such type: no_such_type
$ ssh -p 16039 usr1@rest-sshd-host GET image
cat: /opt/rest-sshd/example/grp1.jpg: No such file or directory
$ ssh -p 16039 usr2@rest-sshd-host GET image > grp2-copy.jpg
$ eog grp2-copy.jpg
## image file will be opened...
```
