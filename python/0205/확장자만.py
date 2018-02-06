import re

passw,idw,kname,ename,tel,hp,email,jumin,ip,sogae = '','','','','','','','','',''


r= re.compile('[^\s].(txt|pdf|hwp|xls)$')##자기소개서 파일 정규식
while True :
    str = input("자기소개서 파일입력")
    if r.search(str) == None:
         print("잘못입력")
         continue
    else :
         sogae=str
         print(str)
         break

r= re.compile('[0-2][0-9][0-9](.)[0-2][0-9][0-9](.)[0-2][0-9][0-9](.)[0-2][0-9][0-9]')##ip주소 정규식
while True :
    str = input("ip주소입력")
    for i in [0,4,8,12]:
        if (str[i] == 2 )and (str[i+1] > 5 or str[i+2] >5):
            print("잘못입력")     
            break
        elif r.search(str) == None:
            print("잘못입력")
            continue
        else :
            ip=str
            print(str)
            break
