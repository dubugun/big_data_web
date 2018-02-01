sel = input("16진수 한글자를 입력해주세요")

if ord(sel) >= ord('a') and ord(sel) <= ord('f'):
    print("10진수로",int(sel,16),"입니다")

elif ord(sel) >= ord('A') and ord(sel) <= ord('F'):
    print("10진수로",int(sel,16),"입니다")

elif ord(sel) >= ord('0') and ord(sel) <= ord('9'):
    print("10진수로",int(sel,16),"입니다")

else :
    print("16진수가 아닙니다.")



