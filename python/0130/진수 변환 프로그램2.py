sel = int(input("입력진수 결정(16/10/8/2) : "))
num = input("값 입력 : ")

num10 = int(num, sel)


print("16진수 ==> ",hex(num10))
print("10진수 ==> ",num10)
print("8진수 ==> ",oct(num10))
print("2진수 ==> ",bin(num10))
