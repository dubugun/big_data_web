k = 0

dan = int(input("출력하고 싶은 단 수를 입력하세요."))


print('- %d 단 -' % dan)
while k < 10 :
    print(" %d X %d = %2d" % (dan, k, dan * k))
    k += 1
print('')
