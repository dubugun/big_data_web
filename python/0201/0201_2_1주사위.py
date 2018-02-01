import random

num1 = random.randint(1,6)
num2 = random.randint(1,6)

print("첫주사위는 %d 이고 두번째 주사위는 %d 로" % (num1, num2) , end='')

if num1 > num2 :
    print(" 첫번째 사람이 이겼습니다.")

elif num1 == num2 :
    print(" 비겼습니다")

else :
    print(" 두번째 사람이 이겼습니다.")
