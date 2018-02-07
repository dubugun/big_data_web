def vol() :
    vol = 3
    print('현재 음량은 3입니다.')
    num = int(input('증가시킬 만큼의 음량을 입력: '))
    vol += num
    print('증가 후의 음량은 %d 입니다.' % vol)
