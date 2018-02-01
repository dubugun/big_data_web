a = input('은행을  입력해주세요 : ')
b = input('통장이나 카드를 선택해주세요 : ')
c = input('입금수단을 입력해주세요 : ')




if (a == '파이') and ((b == 'card') or (b == 'bankbook')) and c == 'money':
    print('입금이 가능합니다')
else :
    print('입금이 불가능합니다.')
