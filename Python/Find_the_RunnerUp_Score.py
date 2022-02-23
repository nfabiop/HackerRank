if __name__ == '__main__':
    n = int(input())
    arr = map(int, input().split())
    
    lista = list(arr)
    
    maximo= lista[0]
    minimo=lista[0]
    
    for i in lista:
        if i > maximo:
            maximo = i
        if i < minimo:
            minimo = i
    
    runner= minimo        
    for j in lista:
        if (j> runner and j < maximo):
            runner = j
    print(runner)
