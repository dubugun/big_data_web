i, k = 0,0


for j in range(2,10) :
    print('---%d 단---' % j, end='  ')


for i in range(1, 10, 1) :
    print('')
    for k in range(2,10,1) :
        print(" %d X %d = %2d" % (k, i, i * k), end=' ')

    
