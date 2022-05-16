# Task 8.1
#### 1.Write easy program, which will display current date and time.

```
import datetime
now = datetime.datetime.now()
print ("Current date and time : ")
print (now.strftime("%Y-%m-%d %H:%M:%S"))
```
#### 2.Write python program, which will accept comma-separated numbers, and then it should write tuple and list of them:
Enter numbers: 1, 2, 7, 43, 9
Output:List: [‘1’, ‘2’, ‘7’, ‘43’, ‘9’]
Tuple: (‘1’, ‘2’, ‘7’, ‘43’, ‘9’)
```
a = input('Print some comma-separated numbers - ')
print(f"List: {list(a.split(','))}")
print(f"Tuple: {tuple(a.split(','))}")
```
#### 3.Write python program, which will askfile name. File should be read, and only even lines should be shown.

```
file_name = input('Input name of flie')
with open(file_name, 'r') as open_file:
    a = 0
    for line in open_file.readlines():
        a +=1
        if a%2-1 :
            print(line)
```

#### 4.Write python program, which should read htmldocument, parse it, and showit’s title.

```
from bs4 import BeautifulSoup
 
with open("1.html", "r") as htmlfile:
    
    contents = htmlfile.read()
 
    soup = BeautifulSoup(contents, 'lxml')
 
    print(soup.title)

```

#### 5.Write pythonprogram, which will parse user’s text, and replace some emotions with emoji’s (Look: pip install emoji)

```
import emoji
while True:
    answ = int(input('''
How are you feeling?
Please, choose one and type a number:
1. I'm happy
2. I'm in love
3. I'm angry
4. I'm seek
5. I'm laughing 
    '''))
    
    if answ == 1:
        print (emoji.emojize(':squinting_face_with_tongue:'))
    elif answ == 2:
        print (emoji.emojize(':smiling_cat_with_heart-eyes:'))
    elif answ == 3:
        print (emoji.emojize(':pouting_face:'))
    elif answ == 4:
        print (emoji.emojize(':face_with_medical_mask:'))
    elif answ == 5:
        print (emoji.emojize(':face_with_tears_of_joy:'))
    else:
        print (emoji.emojize(':face_screaming_in_fear:'))
```

#### 6.Write program, that will show basic PC information (OS, RAM amount, HDD’s, andetc.)

```
import psutil
import platform

uname = platform.uname()

print(f"System: {uname.system}")
print(f"Node Name: {uname.node}")
print(f"Release: {uname.release}")
print(f"Version: {uname.version}")
print(f"Machine: {uname.machine}")
print(f"Processor: {uname.processor}")
print(f"Memory :{psutil.virtual_memory().total/1024/1024/1024} Gb")
print("Number of cores in system", psutil.cpu_count())
print("Disk: ", psutil.disk_partitions()[1])

```