if __name__ == '__main__':
    n = int(input())
    i = 1
    d = 1
    resultado = 0
    while i <= n:
        aux = n-i+1
        if aux > 99:
            resultado = resultado + (aux*d)
            d = d * 1000
        elif aux > 9:
            resultado = resultado + (aux*d)
            d = d * 100
        else:
            resultado = resultado + (aux*d)
            d = d * 10
        i += 1
    print(str(resultado))
