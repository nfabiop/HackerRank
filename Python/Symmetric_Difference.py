# Enter your code here. Read input from STDIN. Print output to STDOUT


m = int(input())
arr_m = set(list(map(int,input().split())))
n = int(input())
arr_n = set(list(map(int,input().split())))

a = arr_m.difference(arr_n)
b = arr_n.difference(arr_m)

a = a.union(b)
a = list(a)
a.sort()

for elem in a:
    print(elem)
