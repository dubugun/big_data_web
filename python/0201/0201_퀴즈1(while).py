i, k = 2,1





while i < 5 :
    print('- %d 단 -' % i)
    while k < 10 :
        print(" %d X %d = %2d" % (i, k, i * k))
        k += 1
    if k == 10 :
        k = 1
    i += 1
    print('')
