num1 = int(input("진수"))

num2 = input("첫 수")

num3 = input("두번째 수")

num22 = int(num2, num1)
num33 = int(num3, num1)



print("연산결과")
print("16진수 => ", hex(num22 & num33))
print("8진수 => ", oct(num22 & num33))
print("10진수 => ", num22 & num33)
print("2진수 => ", bin(num22 & num33))

print("연산결과")
print("16진수 => ", hex(num22 | num33))
print("8진수 => ", oct(num22 | num33))
print("10진수 => ", num22 | num33)
print("2진수 => ", bin(num22 | num33))

print("연산결과")
print("16진수 => ", hex(num22 | num33))
print("8진수 => ", oct(num22 | num33))
print("10진수 => ", num22 | num33)
print("2진수 => ", bin(num22 | num33))
