# Solve the problem in question 4 using any programming language you like

import re
import os

with open('file.txt', 'r') as f:
    file = f.readlines()

#checking if unix is present and number of occurrence
    for word in file:
        x = re.findall("unix",word)
        if x:
            print(f"Yes, We have match with {len(x)} occurrence(s)")
        else:
            print("No match")

print('\n')

#Using awk command to return manager word in the text file
awk_test = os.system("awk '/manager/ {print}' /Users/agansop/repo/kraken-test/file2.txt")
print(awk_test)