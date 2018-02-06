F = {'사과' : 1000,'포도' : 3000,'배' : 2000,'귤' : 500}


str1 = ''
total = 0
totalnum = ''
while True :
    str1 = input('구입하려는 과일의 이름을 입력하세요. (입력을 종료하려면 q를 입력)')
    if str1 == 'q' :
        break
    else :        
        num = int(input('구입하려는 과일의 개수를 입력하세요.'))
        
        if str1 == '포도' :
            total += num * F[str1] * 0.7
            포도 = num
            totalnum += (' 포도 %d ' % 포도)
            print('총가격은',total,'원 입니다.')
            print(totalnum)
        elif str1 == '귤' :            
            total += num * F[str1]
            dum = (num // 10) *2
            num += dum
            귤 = num
            totalnum += (' 귤 %d ' % 귤)        
            print('총가격은',total,'원 입니다.')
            print(totalnum)
        elif str1 == '사과' :
            사과 = num
            totalnum += (' 사과 %d ' % 사과)
            total += num * F[str1]
            print('총가격은',total,'원 입니다.')
            print(totalnum)
        else :
            배 = num
            totalnum += (' 배 %d ' % 배)
            total += num * F[str1]
            print('총가격은',total,'원 입니다.')
            print(totalnum)
    
