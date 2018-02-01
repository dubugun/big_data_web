score = int(input('점수를 입력하세요 : '))

if score >= 95 and score <= 100:
    print('a+ 등급')

elif score >= 90 and score < 95 :
    print('a 등급')

elif score >= 85 and score < 90 :
    print('b+ 등급')

elif score >= 80 and score < 85 :
    print('b 등급')

elif score >= 75 and score < 80 :
    print('c+ 등급')

elif score >= 70 and score < 75 :
    print('c 등급')

elif score >= 65 and score < 70 :
    print('d+ 등급')

elif score >= 60 and score < 65 :
    print('d 등급')

elif score < 60 :
    print('F 등급')
