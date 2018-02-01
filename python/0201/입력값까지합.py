i, hap = 0,0
num = 0

num = int(input('값 입력 : '))

for i in range(1, num+1, 1) :
    hap = hap + i


print('1에서 %d까지 합 : %d' % (num, hap))
