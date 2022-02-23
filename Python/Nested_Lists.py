if __name__ == '__main__':
    lista = []
    for _ in range(int(input())):
        lista1=[]
        name = input()
        score = float(input())
        lista1.append(name)
        lista1.append(score)
        lista.append(lista1)
    
        
    max_score = lista[0][1]
    min_score = lista[0][1]
    
    for i in lista:
        if i[1] < min_score:
            min_score = i[1]
        if i[1] > max_score:
            max_score = i[1]
    
    runner = max_score
            
    for j in lista:
        if (j[1] < runner and j[1] > min_score):
            runner = j[1]
    
    final=[]
    for k in lista:
        if k[1] == runner:
            final.append(k[0]) 
    
    l_aux = []       
    count= 0
    
    while count < len(final):
        z=0
        indice=0
        texto = final[0]
        for m in final:
            if m <= texto:
                texto = m
                z = indice
            indice = indice +1
        print(final[z])
        final.pop(z)  
                
       
