#!/bin/bash

#Script kiddies: Source or come up with a text manipulation problem and
#solve it with at least two of awk, sed, tr and / or grep

#Replace only linux by unix
sed 's/unix/linux/' file.txt
#Replace linux bu unix globally
sed 's/unix/linux/g' file.txt

#Return all lines with manager word
awk '/manager/ {print}' file2.txt
#Return the 1st and 4th column from the given file
awk '{print $1,$4}' file2.txt