#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'stdDev' function below.
#
# The function accepts INTEGER_ARRAY arr as parameter.
#

def stdDev(arr):
    # Print your answers to 1 decimal place within this function
    l = len(arr)
    suma = 0
    for i in arr:
        suma = suma + i
    
    a_mean = suma/l
    
    sd_suma = 0
    for i in arr:
        sd_suma = sd_suma + ((i - a_mean)**2)
    
    s = "{:.1f}".format((sd_suma/l)**0.5)
    print(s)

if __name__ == '__main__':
    n = int(input().strip())

    vals = list(map(int, input().rstrip().split()))

    stdDev(vals)
