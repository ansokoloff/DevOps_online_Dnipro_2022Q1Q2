#!/bin/bash
function all {  
                echo Please wait some time 
                address=`ip a | grep inet | fgrep -v inet6 | fgrep -v 127.0.0.1 | awk '{print $2}'`
                for i in $address
                do
                        MASK=${i##*/}
                        NETWORK=${i%.*}
                        RESULT=$NETWORK".0/"$MASK
                        nmap -sP -PR $RESULT | awk '{print $5 $6}' | fgrep -v latency | fgrep -v address
                done
}

function target() {
                echo At your machine next ports are opened:
                netstat -lntu | egrep tcp | egrep -v tcp6 | awk '{print $4}' | awk -F ':' '{print $2}'
}

function anything {
                echo You must use options \"--all\" or \"--target\"
}
case $1 in
        --all)  
                all
                ;;
        --target)
                target
                ;;
        *)
                anything
                ;;
esac
