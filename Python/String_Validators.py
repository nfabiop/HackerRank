if __name__ == '__main__':
    s = input()
    
    alfa = False
    for i in s:
        if i.isalpha() or i.isdigit() :
            alfa = True
    print(alfa) #alphanumeric
    print(alfa and not s.isdigit()) # alphabetical 
    print(alfa and not s.isalpha()) # digits 
    print(alfa and not s.isdigit() and not s.isupper()) # lowercase 
    print(alfa and not s.isdigit() and not s.islower()) # uppercase 
