a = int(input('사과 구매개수를  입력해주세요 : '))
g = int(input('포도 구매개수를  입력해주세요 : '))
b = int(input('배 구매개수를  입력해주세요 : '))
t = int(input('귤 구매개수를  입력해주세요 : '))

total = a * 1000 + g * 3000 + b * 2000 + t* 500

if g >= 3 :
    total = total * 0.9
    print('결제금액은 할인해서 총 %d원 입니다' % total)
else :
    print('결제 금액은 총 %d원 입니다.' % total)
