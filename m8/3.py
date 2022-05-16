file_name = input('Input name of flie')
with open(file_name, 'r') as open_file:
    a = 0
    for line in open_file.readlines():
        a +=1
        if a%2-1 :
            print(line)
    