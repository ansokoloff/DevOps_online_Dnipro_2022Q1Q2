# Task 4.2

#### 1) Specify several pseudo-users, how to define them?

```sh
cat /etc/passwd | grep 'nologin\|false' | awk -F ':' {'print $1'}
```
***
#### 2) What are the uid ranges? What is UID? How to define it?
```sh
cat /etc/passwd | grep 'bash' | awk -F ':' {'print $1 "  " $3'}
```
```shell
usermod -u 1001 ubunntu
```
***
#### 3) What is GID? How to define it?
```sh
cat /etc/passwd | grep 'bash' | awk -F ':' {'print $1 "  " $4'}
```
***
#### 4) How to determine belonging of user to the specific group?
```shell
groups jenkins
```
***
#### 5) What are the commands for adding a user to the system?
```shell
adduser 
```
***
#### 6) How do I change the name (account name) of an existing user?
```shell
usermod -l new_login old_new_login
```
***
#### 7) What is skell_dir? What is its structure?
    * Directory skel (skel is derived from the “skeleton”) is used to initiate home directory when a user is first created.
```sh
ls -la /etc/skel/
total 20
drwxr-xr-x   2 root root 4096 Mar  9 02:03 .
drwxr-xr-x 100 root root 4096 Mar 29 14:31 ..
-rw-r--r--   1 root root  220 Feb 25  2020 .bash_logout
-rw-r--r--   1 root root 3771 Feb 25  2020 .bashrc
-rw-r--r--   1 root root  807 Feb 25  2020 .profile
```
***
#### 8) How to remove a user from the system
```shell
userdel -r USER_LOGIN
```
***
#### 9) What commands and keys should be used to lock and unlock a user account
```shell
chage -E0 USER_LOGIN
```
```shell
chage -E1 USER_LOGIN
```
###### soft block:
```shell
usermod -L USER_LOGIN
```
```shell
passwd -l USER_LOGIN
```
***
#### 10) How to remove a user's password
```shell
passwd -d USER_LOGIN
```
***
#### 11) Display the extended format of information about the directory

```shell
arctic@epamtask4:~$ stat /home/jenkins/
  File: /home/jenkins/
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 801h/2049d      Inode: 516104      Links: 4
Access: (0755/drwxr-xr-x)  Uid: ( 1003/ jenkins)   Gid: ( 1004/ jenkins)
Access: 2022-03-29 12:01:39.016362516 +0000
Modify: 2022-03-27 13:14:07.469942970 +0000
Change: 2022-03-27 13:14:07.469942970 +0000
 Birth: -
```

#### 12) What access rights exist and for whom (i. e., describe the main roles)? Briefly describe the acronym for access rights.

* There are three kinds of access rights:
    - Owner
    - Group
    - Other
* Each type of access rights has three possibiity:
    - Read
    - Write
    - Execute

***
#### 13) What is the sequence of defining the relationship between the file and the user?

Superuser can give some rights to anyone.
Owner of the fie can give permission only to file which belong to him

***

#### 14) What commands are used to change the owner of a file (directory), as well as the mode of access to the file?
```shell
arctic@epamtask4:~$ touch test
arctic@epamtask4:~$ stat test
  File: test
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 801h/2049d      Inode: 516197      Links: 2
Access: (0775/drwxrwxr-x)  Uid: ( 1002/  arctic)   Gid: ( 1003/  arctic)
Access: 2022-03-30 06:52:23.913770559 +0000
Modify: 2022-03-30 06:52:23.913770559 +0000
Change: 2022-03-30 06:52:23.913770559 +0000
 Birth: -
arctic@epamtask4:~$ chmod 0700 test
arctic@epamtask4:~$ stat test
  File: test
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 801h/2049d      Inode: 516197      Links: 2
Access: (0700/drwx------)  Uid: ( 1002/  arctic)   Gid: ( 1003/  arctic)
Access: 2022-03-30 06:52:23.913770559 +0000
Modify: 2022-03-30 06:52:23.913770559 +0000
Change: 2022-03-30 06:52:58.397182017 +0000
 Birth: -
 arctic@epamtask4:~$ sudo chown ubuntu test
arctic@epamtask4:~$ stat test
  File: test
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 801h/2049d      Inode: 516197      Links: 2
Access: (0700/drwx------)  Uid: ( 1000/  ubuntu)   Gid: ( 1003/  arctic)
Access: 2022-03-30 06:52:23.913770559 +0000
Modify: 2022-03-30 06:52:23.913770559 +0000
Change: 2022-03-30 06:53:45.781869789 +0000
 Birth: -
```
***
#### 15) What is an example of octal representation of access rights? 
```shell
Access: (0775/drwxrwxr-x)
rwxrwxr-x = 2**2*1 + 2**1*1 + 2**0*1 - 2**2*1 + 2**1*1 + 2**0*1 - 2**2*1 + 2**1*0 + 2**0*1
```
> umask command specifies the permissions that the user does not want to be given out to the newly created file or directory

#### 16) Give definitions of sticky bits and mechanism of identifier substitution

> Sticky bit restrict rights to remove directory. The directory with this bit can be removed only by owner.

```shell
arctic@epamtask4:~$ ls -ld /tmp/
drwxrwxrwt 13 root root 4096 Mar 30 06:27 /tmp/
```
#### 17) What file attributes should be present in the command script?

> The rights to execution - 'x'
> After creating a script we must change the rights as chmod +x script_file