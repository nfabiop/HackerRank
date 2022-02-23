def swap_case(s):
    aux=""
    for i in s:
        if i.isupper():
            aux = aux + i.lower()
        else:
            aux = aux + i.upper()
        
    return aux
