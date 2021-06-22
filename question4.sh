#!/bin/bash

#Script kiddies: Source or come up with a text manipulation problem and
#solve it with at least two of awk, sed, tr and / or grep

sed 's/unix/linux/' file.txt
sed 's/unix/linux/g' file.txt

awk '/manager/ {print}' file2.txt
awk '{print $1,$4}' file2.txt