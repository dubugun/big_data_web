a = int(input('첫 과목 점수를 입력해주세요 : '))
b = int(input('두번째 과목 점수를 입력해주세요 : '))
c = int(input('세번째 과목 점수를 입력해주세요 : '))




if (a >= 60 and b >= 60 and c >= 60) or (a+b+c)/3 >= 70:
    print('자격증을 딸 수 있다')
else :
    print('자격증을 딸 수 없다')
