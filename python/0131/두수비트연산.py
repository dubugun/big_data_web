sel = int(input("진수(2/8/10/16)를 선택하시오"))
num1 = input("첫 번째 수를 입력하시오. ")
num2 = input("두 번째 수를 입력하시오. ")

num11 = int(num1, sel)
num22 = int(num2, sel)





print("두 수의 & 연산 결과")
print("16진수 ==> ",hex(num11&num22))
print("8진수 ==> ",oct(num11&num22))
print("10진수 ==> ",num11&num22)
print("2진수 ==> ",bin(num11&num22),'\n')

print("두 수의 | 연산 결과")
print("16진수 ==> ",hex(num11|num22))
print("8진수 ==> ",oct(num11|num22))
print("10진수 ==> ",num11|num22)
print("2진수 ==> ",bin(num11|num22),'\n')

print("두 수의 ^ 연산 결과")
print("16진수 ==> ",hex(num11^num22))
print("8진수 ==> ",oct(num11^num22))
print("10진수 ==> ",num11^num22)
print("2진수 ==> ",bin(num11^num22))
