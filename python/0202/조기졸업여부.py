day = int(input("이수 학기 = "))
cls = int(input("이수 학점 = "))

if day < 8 and cls >= 140:
    print("귀하는 조기 졸업자 입니다.")

elif day == 8 and cls >= 140:
    print("귀하는 정상 졸업자 입니다.")

else :
    print("귀하는 졸업 대상자가 아닙니다")
