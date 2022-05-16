from bs4 import BeautifulSoup
 
with open("1.html", "r") as htmlfile:
    
    contents = htmlfile.read()
 
    soup = BeautifulSoup(contents, 'lxml')
 
    print(soup.title)
