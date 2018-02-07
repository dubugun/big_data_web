name , num , ad , bir = '', '', '', ''

f = open('0207.txt','w')

import re

r = None

while True :
    name = input('이름을 입력해주세요')
    if name == 'q' :
        break
    elif len(name) > 5 :
        continue
    else :
        line = '이름은 ' + name + '\n'
        f.write(line)
        break

while True :    
    num = input('학번을 입력하세요')
    
    if int(num[0:4]) >= 1990 and int(num[0:4]) <= 2017 :
        if int(num[6:]) <=100:
            line = '학번은 ' + num + '\n'
            f.write(line)
            break       
    else :
        continue

while True :
    ad = input('주소를 입력해주세요')
    adlist = ['서울','대전','대구','부산','광주','인천','울산','경북','경남','충북',
              '충남','제주','강원','전북','전남']
    if (ad[0:2] in adlist) and len(ad) <= 20:
        line = '주소는 ' + ad + '\n'
        f.write(line)
        break
    else :
        continue
    

while True :
    bir = input('생년월일을을 입력해주세요')
    if len(bir) == 6 :
        line = '생일은 ' + bir + '\n'
        f.write(line)
        break
    else :
        continue


f.close()
