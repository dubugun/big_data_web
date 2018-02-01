score1 = int(input('숫자를 입력하세요.'))


if score1 > 10 :
    if score1 % 2 == 0:
        print("입력한 숫자 %d 는 10보다 큰 짝수 입니다." % score1)
    else :
        print("입력한 숫자 %d 는 10보다 큰 홀수 입니다." % score1)

else :
    if score1 % 2 == 0:
        print("입력한 숫자 %d 는 10보다 크지않은 짝수 입니다." % score1)
    else :
        print("입력한 숫자 %d 는 10보다 크지않은 홀수 입니다." % score1)
