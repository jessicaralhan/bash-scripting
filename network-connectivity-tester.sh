#!/bin/bash

echo "Enter the file name:"
read file

echo "Ping Results:" > results.log

while read line; do
    ping -c 1 $line > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "$line is reachable" >> results.log
    else
        echo "$line is unreachable" >> results.log
    fi
done < $file

echo "Results are saved in results.log"
