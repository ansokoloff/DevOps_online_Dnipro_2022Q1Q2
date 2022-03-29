# Task4.1
## 1) and 2)
 - When password of some users will be changed, the file /etc/shadow will be changed too.
![](scr1.png)

## 3) 
 
- I'd used a command 
```sh
w 
```
to determine the users who right now in system are

- This command show:
  - user login
  - the current time
  - how long the system has been running
  - how many users are currently logged on, and the system load aver‐
    ages for the past 1, 5, and 15 minutes.
- for each user: 
  - login name 
  - the tty name 
  - the remote host 
  - login time 
  - idle time 
  - JCPU 
  - PCPU 
  - the command line of their current process.

         The JCPU time is the time used by all processes attached to the tty.  It does not include past background jobs, but  does
         include currently running background jobs.

         The PCPU time is the time used by the current process, named in the "what" field  

![](scr2.png)

## 4) and 5)
I've changed information about me and I've used two options for these command
```sh
usermod -s  
```
```sh
usermod -a -G
```
First options change the shell of the user, second option add the user to the supplementary group

![](scr3.png)

## 6) 
```sh
more
```
This command shows a one page of file
```sh
less
```
This command is combine of two commands - vi and more

## 7)
I've used this command with option -s
```sh
finger -s jenkins
```
![](scr4.png)
## 8)
Two commands with same possibility was used by me - 
```sh
tree
```
```sh
ls -la
```
![](scr6.png)
# Part2
## 1)Examine the tree command.
![](scr8.png)
## 2) What command can be used to determine the type of file
![](scr9.png)
## 3) How can you go back to your home directory from anywhere in the filesystem?
![](scr10.png)
## 4) Give examples of listing directories using different keys.
![](scr12.png)
## 5) Perform the following sequence of operations:
![](scr13.png)
## 6) Perform the following sequence of operations:
create a subdirectory test in the home directory;

![](scr14.png)
## 7) Using the locate utility, find all files that contain the squid and traceroute sequence
![](scr15.png)
## 8) Determine which partitions are mounted in the system
```sh
df -aTh
```
![](scr16.png)
## 9) Count the number of lines containing a given sequence of characters in a given file.
![](scr17.png)
## 10) Using the find command
![](scr18.png)
## 11) List all objects in /etc that contain the ss character sequence
![](scr19.png)
## 12) Organize a screen-by-screen print of the contents of the /etc directory
```sh
cat /etc/* | more
```
![](scr23.png)
![](scr24.png)
## 13) ) What are the types of devices and how to determine the type of device?

```sh
dmesg | less
```

![](scr25.png)

## 15) * List the first 5 directory files

![](scr26.png)
