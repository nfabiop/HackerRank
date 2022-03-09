#!/bin/python3

import math
import os
import random
import re
import sys

#
# Complete the 'quartiles' function below.
#
# The function is expected to return an INTEGER_ARRAY.
# The function accepts INTEGER_ARRAY arr as parameter.
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
        #median = (X[a]+X[b])/2
    else:
        a_mediana = (X[int(l/2)-1] + X[int(l/2)])/2 
        #median = X[b]/2
    return a_mediana


def quartiles(arr):
    # Write your code here
    arr = a_sorted(arr)
    l = len(arr)
    mp = int(l//2)

    if l%2 != 0:
        q2 = arr[mp]
        q1 = a_mediana(arr[0:mp])
        q3 = a_mediana(arr[mp+1:len(arr)])
    else:
        q1 = a_mediana(arr[0:mp])
        q3 = a_mediana(arr[mp:len(arr)])
        q2 = (arr[mp-1] + arr[mp])/2    
    return [int(q1),int(q2),int(q3)]

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    n = int(input().strip())

    data = list(map(int, input().rstrip().split()))

    res = quartiles(data)

    fptr.write('\n'.join(map(str, res)))
    fptr.write('\n')

    fptr.close()
