T = float(input('T-shirts 개수 입력 : '))
S = float(input('Sweater 개수 입력 : '))
total = 10000 * T + 30000 * S


if total <= 100000 :
    total = total*0.95
    print('합계 : %.0f 원' % total)
else :
    total = total*0.85
    print('합계 : %.0f 원' % total)
