if __name__ == '__main__':
    n = int(input())
    student_marks = {}
    for _ in range(n):
        name, *line = input().split()
        scores = list(map(float, line))
        student_marks[name] = scores
    query_name = input()
    
    suma = 0.00
    for s in student_marks[query_name]:
        suma = suma + s
    print('%.2f' % (suma/3))

    
