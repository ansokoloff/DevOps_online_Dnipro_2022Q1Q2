#!/bin/bash
echo From which ip were the most requests?
cat apache_logs.txt | awk '{print $1}' | sort | uniq -c | sort -rnk1 | head -1
# a=`cat apache_logs.txt | awk '{print $1}' | sort | uniq -d `
# for i in $a
# do
# sum=`grep $i apache_logs.txt | wc -l`
# echo $sum "-" $i >> tmp 
# done
# echo From which ip were the most requests?
# cat tmp | sort -rnk1 | head -1
# rm tmp

#second task
echo What is the most requested page? 
cat apache_logs.txt | awk '{print $7}' | sort | uniq -c | sort -rnk1 | head -3

echo How many requests were there from each ip? 
cat apache_logs.txt | awk '{print $1}' | sort | uniq -c | sort -rnk1

echo What non-existent pages were clients referred to? 
egrep 'error404' apache_logs.txt | awk '{print $7}' | sort | uniq -c | sort -rnk1

echo What time did site get the most requests? 
cat apache_logs.txt | awk '{print $4}' | awk -F '/' '{print $3}' | awk '{print $1}' |  sort | uniq -cd | sort -rnk1 | head -5

echo What search bots have accessed the site \(UA + IP\)?

echo bingbot
cat apache_logs.txt | egrep bingbot | awk '{print $1}' | sort | uniq -d 

