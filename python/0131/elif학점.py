score = int(input('점수를 입력하세요 : '))

if score >= 90 and score <= 100:
    print('A 등급')

elif score >= 80 and score < 90 :
    print('B 등급')

elif score >= 70 and score < 80 :
    print('C 등급')

elif score < 70 :
    print('F 등급')
