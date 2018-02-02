F = {'사과' : 1000,'포도' : 3000,'배' : 2000,'귤' : 500}


str1 = ''


while str1 != 'q' :
    str1 = input('구입하려는 과일의 이름을 입력하세요.')
    num = int(input('구입하려는 과일의 개수를 입력하세요.'))
    
    if str1 == '포도' :
        total = num * F[str1] * 0.9
        print(total)
        print(num)
    elif str1 == '귤' :
        total = num * F[str1]
        num = num * 1.2
        print(total)
        print(num)
    else :
        total = num * F[str1]
        print(total)
        print(num)
