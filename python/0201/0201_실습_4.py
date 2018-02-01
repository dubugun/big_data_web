i, hap = 0,0
num1, num2 = 0,0

num1 = int(input('시작값 입력 : '))
num2 = int(input('끝값 입력 : '))


for i in range(num1, num2+1, 1) :
    hap = hap + i


print('%d에서 %d까지 값의 합 : %d' % (num1, num2, hap))
