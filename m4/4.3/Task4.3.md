# Task 4.3

#### 1. How many states could has a process in Linux?

* Running or Runnable (R)
* Uninterruptible Sleep (D)
* Interruptable Sleep (S)
* Stopped (T)
* Zombie (Z)

#### 2. Examine the pstree command. Make output (highlight) the chain (ancestors) of the current process.
```shell
arctic@epamtask4:~$ pstree -h arctic
screen─┬─bash───pstree
       └─bash───sudo───bash───man───pager

sshd───bash───screen

systemd───(sd-pam)
```
#### 3. What is a proc file system?

> Proc file system (procfs) is virtual file system created on fly when system boots and is dissolved at time of system shut down. It contains useful information about the processes that are currently running, it is regarded as control and information center for kernel

#### 4. Print information about the processor (its type, supported technologies, etc.).
```shell
arctic@epamtask4:~$ lscpu 
Architecture:                    x86_64
CPU op-mode(s):                  32-bit, 64-bit
Byte Order:                      Little Endian
Address sizes:                   46 bits physical, 48 bits virtual
CPU(s):                          2
On-line CPU(s) list:             0,1
Thread(s) per core:              2
Core(s) per socket:              1
Socket(s):                       1
NUMA node(s):                    1
Vendor ID:                       GenuineIntel
CPU family:                      6
Model:                           79
Model name:                      Intel(R) Xeon(R) CPU @ 2.20GHz
Stepping:                        0
CPU MHz:                         2200.218
BogoMIPS:                        4400.43
Hypervisor vendor:               KVM
Virtualization type:             full
L1d cache:                       32 KiB
L1i cache:                       32 KiB
L2 cache:                        256 KiB
L3 cache:                        55 MiB
NUMA node0 CPU(s):               0,1
Vulnerability Itlb multihit:     Not affected
Vulnerability L1tf:              Mitigation; PTE Inversion
Vulnerability Mds:               Mitigation; Clear CPU buffers; SMT Host state unknown
Vulnerability Meltdown:          Mitigation; PTI
Vulnerability Spec store bypass: Mitigation; Speculative Store Bypass disabled via prctl and seccomp
Vulnerability Spectre v1:        Mitigation; usercopy/swapgs barriers and __user pointer sanitization
Vulnerability Spectre v2:        Mitigation; Retpolines, IBPB conditional, IBRS_FW, STIBP conditional, RSB filling
Vulnerability Srbds:             Not affected
Vulnerability Tsx async abort:   Mitigation; Clear CPU buffers; SMT Host state unknown
Flags:                           fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht sy
                                 scall nx pdpe1gb rdtscp lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmu
                                 lqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm ab
                                 m 3dnowprefetch invpcid_single pti ssbd ibrs ibpb stibp fsgsbase tsc_adjust bmi1 hle avx2 smep bmi2 erms i
                                 nvpcid rtm rdseed adx smap xsaveopt arat md_clear arch_capabilities
```
#### 5. Use the ps command to get information about the process. 
```shell
arctic@epamtask4:~$ ps -U arctic -u arctic u
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
arctic      1058  0.0  0.9  18364  9324 ?        Ss   Mar29   0:00 /lib/systemd/systemd --user
arctic      1059  0.0  0.3 103360  3544 ?        S    Mar29   0:00 (sd-pam)
arctic      1344  0.0  0.3   9580  3424 ?        Rs   Mar29   0:00 SCREEN -rR
arctic      1345  0.0  0.5  10156  5120 pts/1    Ss   Mar29   0:00 /bin/bash
arctic      1353  0.0  0.4  10024  4056 pts/2    Ss   Mar29   0:00 /bin/bash
arctic      8408  0.0  0.6  13940  6032 ?        S    06:44   0:00 sshd: arctic@pts/0
arctic      8409  0.0  0.5  10172  5272 pts/0    Ss   06:44   0:00 -bash
arctic      8461  0.0  0.3   8580  3020 pts/0    S+   06:51   0:00 screen -rR
arctic      8721  0.0  0.3  10620  3220 pts/1    R+   07:41   0:00 ps -U arctic -u arctic u
```

#### 6. How to define kernel processes and user processes?

> 1. Kernel-supported processes are aware of the kernel, while user-level processes are not aware of the kernel.

> 2. Creation, cancellation and scheduling of user-level processes do not require kernel support and are handled at the language level (eg java), while creation, cancellation and scheduling of kernel processes require kernel support.

> 3. A user-level process runs in a program in user mode, and a kernel-level process can execute in any form of thread.

#### 7. Print the list of processes to the terminal.
```shell
arctic      1058  0.0  0.9  18364  9324 ?        Ss   Mar29   0:00 /lib/systemd/systemd --user
arctic      1059  0.0  0.3 103360  3544 ?        S    Mar29   0:00 (sd-pam)
arctic      1344  0.0  0.3   9580  3424 ?        Rs   Mar29   0:00 SCREEN -rR
arctic      1345  0.0  0.5  10156  5120 pts/1    Ss   Mar29   0:00 /bin/bash
arctic      1353  0.0  0.4  10024  4056 pts/2    Ss   Mar29   0:00 /bin/bash
root        1361  0.0  0.3  11184  3632 pts/2    S    Mar29   0:00 sudo -s
root        1362  0.0  0.3   9100  3776 pts/2    S+   Mar29   0:00 /bin/bash
root        6659  0.0  0.0      0     0 ?        S<   Mar29   0:00 [loop12]
root        6765  0.0  0.0      0     0 ?        I    00:00   0:01 [kworker/0:0-events]
root        6968  0.0  0.0      0     0 ?        I    01:37   0:01 [kworker/1:1-cgroup_destroy]
root        7190  0.0  0.0      0     0 ?        I    06:27   0:00 [kworker/0:1]
root        8265  0.0  0.0      0     0 ?        I    06:27   0:00 [kworker/1:2-cgroup_destroy]
root        8280  0.0  0.8  13804  8748 ?        Ss   06:44   0:00 sshd: arctic [priv]
arctic      8408  0.0  0.6  13940  6032 ?        S    06:44   0:00 sshd: arctic@pts/0
arctic      8409  0.0  0.5  10172  5272 pts/0    Ss   06:44   0:00 -bash
root        8458  0.0  0.0      0     0 ?        I    06:51   0:00 [kworker/u4:0-events_unbound]
arctic      8461  0.0  0.3   8580  3020 pts/0    S+   06:51   0:00 screen -rR
root        8695  0.0  0.0      0     0 ?        I    07:37   0:00 [kworker/u4:1-events_power_efficient]
root        8736  0.0  0.0      0     0 ?        R    07:43   0:00 [kworker/u4:2-events_unbound]
root        8796  0.0  0.0      0     0 ?        I    07:43   0:00 [kworker/1:0-events]
arctic      8798  0.0  0.3  10620  3300 pts/1    R+   07:45   0:00 ps aux
```
#### 8. Display only the processes of a specific user.
```shell
arctic@epamtask4:~$ ps -auarctic
    PID TTY          TIME CMD
   1058 ?        00:00:00 systemd
   1059 ?        00:00:00 (sd-pam)
   1344 ?        00:00:00 screen
   1345 pts/1    00:00:00 bash
   1353 pts/2    00:00:00 bash
   1361 pts/2    00:00:00 sudo
   1362 pts/2    00:00:00 bash
   8408 ?        00:00:00 sshd
   8409 pts/0    00:00:00 bash
   8461 pts/0    00:00:00 screen
   8837 pts/2    00:00:00 man
   8847 pts/2    00:00:00 pager
   8855 pts/1    00:00:00 ps
```
#### 9. What utilities can be used to analyze existing running tasks
```shell
top 
```
#### 10. What information does top command display?

> The  top  program provides a dynamic real-time view of a running system.  It can display system summary information as well as a
list of processes or threads currently being managed by the Linux kernel.  The types of system summary information shown and the
types,  order  and size of information displayed for processes are all user configurable and that configuration can be made per‐
sistent across restarts.

***
### 11. Display the processes of the specific user using the top command.

```shell
top -u arctic
```
```shell
Tasks: 121 total,   1 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :    968.1 total,    140.8 free,    197.4 used,    629.9 buff/cache
MiB Swap:      0.0 total,      0.0 free,      0.0 used.    601.9 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                            
   1058 arctic    20   0   18364   9324   7748 S   0.0   0.9   0:00.16 systemd                                                            
   1059 arctic    20   0  103360   3544      0 S   0.0   0.4   0:00.00 (sd-pam)                                                           
   1344 arctic    20   0    9580   3424   1956 S   0.0   0.3   0:00.72 screen                                                             
   1345 arctic    20   0   10156   5120   3252 S   0.0   0.5   0:00.46 bash                                                               
   1353 arctic    20   0   10024   4056   2412 S   0.0   0.4   0:00.01 bash                                                               
   8408 arctic    20   0   13940   6032   4564 S   0.0   0.6   0:00.13 sshd                                                               
   8409 arctic    20   0   10172   5272   3504 S   0.0   0.5   0:00.05 bash                                                               
   8461 arctic    20   0    8580   3020   2776 S   0.0   0.3   0:00.01 screen      
```
***
#### 12. What interactive commands can be used to control the top command? 
```shell
top - 08:35:44 up 20:30,  3 users,  load average: 0.00, 0.00, 0.00
Tasks: 121 total,   1 running, 120 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0.0 us,  0.0 sy,  0.0 ni,100.0 id,  0.0 wa,  0.0 hi,  0.0 si,  0.0 st
MiB Mem :    968.1 total,    140.1 free,    196.5 used,    631.5 buff/cache
MiB Swap:      0.0 total,      0.0 free,      0.0 used.    602.9 avail Mem 
PID to signal/kill [default pid = 1058] 
    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                                            
   1058 arctic    20   0   18364   9324   7748 S   0.0   0.9   0:00.16 systemd                                                            
   1059 arctic    20   0  103360   3544      0 S   0.0   0.4   0:00.00 (sd-pam)                                                           
   1344 arctic    20   0    9580   3424   1956 S   0.0   0.3   0:00.73 screen                                                             
   1345 arctic    20   0   10156   5120   3252 S   0.0   0.5   0:00.46 bash                                                               
   1353 arctic    20   0   10024   4056   2412 S   0.0   0.4   0:00.01 bash                                                               
   9021 arctic    20   0   13932   5916   4452 S   0.0   0.6   0:00.00 sshd                                                               
   9022 arctic    20   0   10040   5152   3456 S   0.0   0.5   0:00.02 bash                                                               
   9032 arctic    20   0    8580   3128   2884 S   0.0   0.3   0:00.00 screen                                                             
   9035 arctic    20   0   11016   3768   3188 R   0.0   0.4   0:00.00 top         
```
```shell
Help for Interactive Commands - procps-ng 3.3.16
Window 1:Def: Cumulative mode Off.  System: Delay 3.0 secs; Secure mode Off.

  Z,B,E,e   Global: 'Z' colors; 'B' bold; 'E'/'e' summary/task memory scale
  l,t,m     Toggle Summary: 'l' load avg; 't' task/cpu stats; 'm' memory info
  0,1,2,3,I Toggle: '0' zeros; '1/2/3' cpus or numa node views; 'I' Irix mode
  f,F,X     Fields: 'f'/'F' add/remove/order/sort; 'X' increase fixed-width

  L,&,<,> . Locate: 'L'/'&' find/again; Move sort column: '<'/'>' left/right
  R,H,J,C . Toggle: 'R' Sort; 'H' Threads; 'J' Num justify; 'C' Coordinates
  c,i,S,j . Toggle: 'c' Cmd name/line; 'i' Idle; 'S' Time; 'j' Str justify
  x,y     . Toggle highlights: 'x' sort field; 'y' running tasks
  z,b     . Toggle: 'z' color/mono; 'b' bold/reverse (only if 'x' or 'y')
  u,U,o,O . Filter by: 'u'/'U' effective/any user; 'o'/'O' other criteria
  n,#,^O  . Set: 'n'/'#' max tasks displayed; Show: Ctrl+'O' other filter(s)
  V,v     . Toggle: 'V' forest view; 'v' hide/show forest view children

  k,r       Manipulate tasks: 'k' kill; 'r' renice
  d or s    Set update interval
  W,Y       Write configuration file 'W'; Inspect other output 'Y'
  q         Quit
          ( commands shown with '.' require a visible task display window ) 
```
***
#### 13. Sort the contents of the processes window using various parameters 

> Previous screen

*** 
#### 14. Concept of priority, what commands are used to set priority?
```shell
nice
```
```shell
renice
```
***
#### 15. Can I change the priority of a process using the top command? If so, how?
```shell
k,r       Manipulate tasks: 'k' kill; 'r' renice
```
***
#### 16. Examine the kill command. 
```shell
arctic@epamtask4:~$ kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```
> Most often uses - 
```shell
kill -9 process_PID
```
***
#### 17.Commands jobs, fg, bg, nohup. What are they for? Use the sleep, yes command to demonstrate the process control mechanism with fg, bg. 
```shell
root@epamtask4:/home/arctic# ps aux | grep bash
arctic      1345  0.0  0.5  10156  5120 pts/1    Ss   Mar29   0:00 /bin/bash
arctic      1353  0.0  0.4  10024  4056 pts/2    Ss   Mar29   0:00 /bin/bash
root        1362  0.0  0.3   9100  3812 pts/2    S    Mar29   0:00 /bin/bash
arctic      9022  0.0  0.5  10040  5152 pts/0    Ss   08:35   0:00 -bash
root        9081  0.0  0.0   8168   720 pts/2    S+   08:49   0:00 grep --color=auto bash
root@epamtask4:/home/arctic# sleep 1345

Killed
root@epamtask4:/home/arctic#
```

### Part2

#### 1. Check the implementability of the most frequently used OPENSSH commands in the MS Windows operating system
```shell
ssh user@[host][:port] remote command
scp source user@host:/location 
scp -R user@host:/location local_directory 
 

```

#### 2.
```shell
root@epamtask4:/home/arctic# cat /etc/ssh/sshd_config | grep  -v '#' | grep -v '^$'
Include /etc/ssh/sshd_config.d/*.conf
PasswordAuthentication no
ChallengeResponseAuthentication no
UsePAM yes
X11Forwarding yes
PrintMotd no
AcceptEnv LANG LC_*
Subsystem       sftp    /usr/lib/openssh/sftp-server
```
#### 3. List the options for choosing keys for encryption in SSH.
```shell
root@epamtask4:/home/arctic# openssl speed rsa1024 rsa2048 rsa4096
Doing 1024 bits private rsa's for 10s: 
88813 1024 bits private RSA's in 9.99s
Doing 1024 bits public rsa's for 10s: 
1359134 1024 bits public RSA's in 9.99s
Doing 2048 bits private rsa's for 10s: 
13204 2048 bits private RSA's in 9.99s
Doing 2048 bits public rsa's for 10s: 
54410 2048 bits public RSA's in 10.00s
Doing 4096 bits private rsa's for 10s: 
240 4096 bits private RSA's in 9.99s
Doing 4096 bits public rsa's for 10s: 
15467 4096 bits public RSA's in 10.00s
OpenSSL 1.1.1f  31 Mar 2020
built on: Wed Mar  9 12:12:45 2022 UTC
options:bn(64,64) rc4(16x,int) des(int) aes(partial) blowfish(ptr) 
compiler: gcc -fPIC -pthread -m64 -Wa,--noexecstack -Wall -Wa,--noexecstack -g -O2 -fdebug-prefix-map=/build/openssl-2iuOVN/openssl-1.1.1f=. -fstack-protector-strong -Wformat -Werror=format-security -DOPENSSL_TLS_SECURITY_LEVEL=2 -DOPENSSL_USE_NODELETE -DL_ENDIAN -DOPENSSL_PIC -DOPENSSL_CPUID_OBJ -DOPENSSL_IA32_SSE2 -DOPENSSL_BN_ASM_MONT -DOPENSSL_BN_ASM_MONT5 -DOPENSSL_BN_ASM_GF2m -DSHA1_ASM -DSHA256_ASM -DSHA512_ASM -DKECCAK1600_ASM -DRC4_ASM -DMD5_ASM -DAESNI_ASM -DVPAES_ASM -DGHASH_ASM -DECP_NISTZ256_ASM -DX25519_ASM -DPOLY1305_ASM -DNDEBUG -Wdate-time -D_FORTIFY_SOURCE=2
                  sign    verify    sign/s verify/s
rsa 1024 bits 0.000112s 0.000007s   8890.2 136049.4
rsa 2048 bits 0.000757s 0.000184s   1321.7   5441.0
rsa 4096 bits 0.041625s 0.000647s     24.0   1546.7
```
#### 4. Implement port forwarding for the SSH client
```shell
ssh -L 2222:34.116.192.112:22 arctic@34.116.192.112
```
```shell
ssh -p 2222 arctic@localhost
The authenticity of host '[localhost]:2222 ([::1]:2222)' can't be established.
ED25519 key fingerprint is SHA256:RDE+eMvymaQqFPAxKE/t9dazzGIjmOJMV21LdrGQpvs.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:62: 34.116.192.112
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[localhost]:2222' (ED25519) to the list of known hosts.
Welcome to Ubuntu 20.04.4 LTS (GNU/Linux 5.13.0-1021-gcp x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Wed Mar 30 09:25:46 UTC 2022

  System load:  0.02              Processes:                128
  Usage of /:   8.9% of 48.29GB   Users logged in:          1
  Memory usage: 31%               IPv4 address for docker0: 172.17.0.1
  Swap usage:   0%                IPv4 address for ens4:    10.186.0.17

 * Super-optimized for small spaces - read how we shrank the memory
   footprint of MicroK8s to make it the smallest full K8s around.

   https://ubuntu.com/blog/microk8s-memory-optimisation

UA Apps: Extended Security Maintenance (ESM) is enabled.

0 updates can be applied immediately.




Last login: Wed Mar 30 09:24:25 2022 from 193.150.88.155
arctic@epamtask4:~$ 
```
***
#### 5. 5*. Intercept (capture) traffic (tcpdump, wireshark) while authorizing the remote client on the server using ssh, telnet, rlogin. Analyze the result.

![](/Users/arctic/IdeaProjects/Task4.2/Scc30.png)
