#!/bin/bash
cd /home/epamtest
[ -d /tmp/backup ] || /usr/bin/mkdir /tmp/backup
f=`/usr/bin/ls -S`
for i in $f 
    do
        if ! /usr/bin/cmp -s $i /tmp/backup/$i ; then
            /usr/bin/cp $i /tmp/backup/
            /usr/bin/echo `date` - updated - $i >> /tmp/tmp.log
        fi
    done
    
cd /tmp/backup
f=`/usr/bin/ls -S`
for i in $f 
    do
       [ -f /home/epamtest/$i ] || /usr/bin/rm /tmp/backup/$i
       /usr/bin/echo `date` - deleted - $i >> /tmp/tmp.log
    done
    
