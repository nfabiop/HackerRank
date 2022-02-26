def merge_the_tools(string, k):
    # your code goes here
    s = int(len(string)/k)
    l=[]
    for i in range(0,len(string),k):
        l.append(string[i:i+k])

    aux = []
    aux_2 = []

    for j in l:
        for k in j:
            if k not in aux:
                aux.append(k)
        st = ''.join(aux)
        aux_2.append(st)        
        aux = []
    
    for elem in aux_2:
        print(elem)
    
   

