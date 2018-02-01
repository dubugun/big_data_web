i, hap = 0,0
num2 = 0


num2 = int(input('끝값 입력 : '))


for i in range(1, num2+1, 1) :
    if i%3 != 0 :
        print(i," ")
    else :
        print('짝 ')


