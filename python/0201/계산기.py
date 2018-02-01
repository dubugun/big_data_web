a, b, ch = 0, 0, ""


a = int(input("첫 번째 수를 입력하세요 : "))
ch = input("계산할 연산자를 입력하세요 : ")
b = int(input("두 번째 수를 입력하세요 : "))


if ch == '+' :
    print(" %d + %d = %d 입니다 " % (a, b, a+b))
    
elif ch == '-' :
    print(" %d - %d = %d 입니다 " % (a, b, a-b))

elif ch == '+' :
    print(" %d * %d = %d 입니다 " % (a, b, a*b))

elif ch == '+' :
    print(" %d / %d = %d 입니다 " % (a, b, a/b))

elif ch == '+' :
    print(" %d % %d = %d 입니다 " % (a, b, a%b))

elif ch == '+' :
    print(" %d // %d = %d 입니다 " % (a, b, a//b))

elif ch == '+' :
    print(" %d ** %d = %d 입니다 " % (a, b, a**b))

else :
    print (" 알 수 없는 연산자 입니다.")
