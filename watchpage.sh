#!/bin/bash

# watchpage.sh - Monitors a web page for changes
# writes timestamp of change in file

URL="ADD URL TO WATCH HERE"

for (( ; ; )); do
    mv new.html old.html 2> /dev/null
    curl $URL -L --compressed -s > new.html
    DIFF_OUTPUT="$(diff new.html old.html)"
    if [ "0" != "${#DIFF_OUTPUT}" ]; then
        date  >> diff_log
        echo $DIFF_OUTPUT >> diff_log
        sleep 10
    fi
    sleep 5
done
