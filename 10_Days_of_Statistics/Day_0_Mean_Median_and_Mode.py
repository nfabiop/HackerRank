# Enter your code here. Read input from STDIN. Print output to STDOUT
N = int(input())
X = list(map(float, input().strip().split()))[:N]

l = len(X)

# AVERAGE

total = 0
for i in range(l):
    total = total + X[i]
ave = total / l
print("{:.1f}".format(ave))

# MEDIAN

list_ordered = []
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

a = int((l-1)//2)
b = a+1  
if l%2 == 0:
    median = (X[a]+X[b])/2
else:
    median = X[b]/2
print("{:.1f}".format(median))

    # MODA
    
    
moda = X[0]
global_counter = 1
lst = []
for i in range(l):
    local_counter = 1
    for j in range(i+1,l):
        if X[j] == X[i]:
            local_counter = local_counter + 1
    lst.append(local_counter)
    if local_counter > global_counter:
        global_counter = local_counter
        pos = i

if global_counter > 1:
    moda = X[pos]
print(moda)
