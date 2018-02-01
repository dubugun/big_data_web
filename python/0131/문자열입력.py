ss = input("문자열 입력==>")

print("출력 문자열==>", end='')
for i in range(len(ss)):
    if ss[i] != 'o' :
        print(ss[i], end='')
    else :
        print('$', end='')
