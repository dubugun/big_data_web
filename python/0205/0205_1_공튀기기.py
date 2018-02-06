h = float(input('높이를 입력하세요(m)'))
i = 0


while h >= 0.00001 :
    h /= 2
    
    i +=1
    print("i : %d h: %f"%(i,h))

print('공이 튀긴 횟수는 %d 회 입니다.' % i)
