#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'interQuartile' function below.
#
# The function accepts following parameters:
#  1. INTEGER_ARRAY values
#  2. INTEGER_ARRAY freqs
#

def a_sorted(X):
    l = len(X)
    i = 0
    while i < l:
        minimo = X[i]
        j = i+1
        pos = i 
        while j < l:
            if X[j] < minimo:
                minimo = X[j]
                pos = j
            j = j+1  
        aux = X[pos]
        X[pos] = X[i]
        X[i] = aux   
        i = i+1        
    return X

def a_mediana(X):
    l = len(X)
    a = int((l-1)//2)
    b = a+1  
    if l%2 != 0:
        a_mediana = X[l//2]
    else:
        a_mediana = (X[int(l/2)-1] + X[int(l/2)])/2 
    return a_mediana
    
def interQuartile(values, freqs):
    # Print your answer to 1 decimal place within this function
    s = []
    l = len(values)
    pos = 0
    i = 0
    while i < l:
        j=0
        while j < freqs[i]:
            s.append(values[i])
            pos = pos + 1
            j = j + 1
        i = i + 1
  
    ls = len(s)    
    s = a_sorted(s)
    mp = int(ls//2)
    
    if ls%2 != 0:
        q1 = a_mediana(s[0:mp])
        q3 = a_mediana(s[mp+1:ls])
    else:
        q1 = a_mediana(s[0:mp])
        q3 = a_mediana(s[mp:ls])
    
    interquart_range = '{:.1f}'.format(q3-q1)
    print(interquart_range)

if __name__ == '__main__':
    n = int(input().strip())

    val = list(map(int, input().rstrip().split()))

    freq = list(map(int, input().rstrip().split()))

    interQuartile(val, freq)
