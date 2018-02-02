def pm(a,b) :
    if (a > 0 and b > 0) or (a < 0 and b < 0) :
        print('두 수를 곱하면 양수 입니다.')
    elif (a > 0 and b < 0) or (a < 0 and b > 0) :
        print('두 수를 곱하면 음수 입니다.')
    else :
        print('두 수를 곱하면 0 입니다.')
