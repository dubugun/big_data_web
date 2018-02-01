score1 = int(input('첫 과목 점수를 입력하세요 : '))
score2 = int(input('두번째 과목 점수를 입력하세요 : '))
score3 = int(input('세번째 과목 점수를 입력하세요 : '))

if score1 < 40 or score2 < 40 or score3 < 40:
    print('과락입니다.')

elif (score1 + score2 + score3) / 3 >= 60 :
    print('합격입니다.')

else :
    print('불합격입니다.')
