def count_substring(string, sub_string):
    counter = 0
    for i in range(len(string)):
        a = string.find(sub_string,i,len(string))
        if a == i:
            counter += 1
    return counter

