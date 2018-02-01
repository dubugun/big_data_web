hap, i = 0,0

for i in range(1,1001) :
    if i % 2 ==0 :
        continue
    hap += i
    if hap >= 1000 :
        break

print('1~1000까지 합하던중 최초로 1000이 넘는 위치 : %d' % i)
