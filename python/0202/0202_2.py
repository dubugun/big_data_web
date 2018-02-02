coffee = 0


def coffee_machine(button) :
    print()
    print('# 1. 뜨거운 물을 준비한다.')
    print('# 2. 종이컵을 준비한다.')


    if button == 1 :
        print('# 3. (자동으로) 아메리카노를 탄다')
    elif button == 2:
        print('# 3. (자동으로) 카페라떼를 탄다')
    elif button == 3:
        print('# 3. (자동으로) 카푸치노를 탄다')
    elif button == 4 :
        print('# 3. (자동으로) 에스프레소를 탄다\n')

    print('# 4. (자동으로) 물을 붓는다')
    print('# 5. (자동으로) 스푼으로 저어서 녹인다')
    print()




coffee = int(input('철수손님, 어떤 커피 드릴까요 ? (1:아메리카노, 2:카페라떼, 3:카푸치노, 4:에스프레소) '))
coffee_machine(coffee)
print('철수손님~ 커피 여기 있습니다.')

coffee = int(input('영희손님, 어떤 커피 드릴까요 ? (1:아메리카노, 2:카페라떼, 3:카푸치노, 4:에스프레소) '))
coffee_machine(coffee)
print('영희손님~ 커피 여기 있습니다.')

coffee = int(input('길동손님, 어떤 커피 드릴까요 ? (1:아메리카노, 2:카페라떼, 3:카푸치노, 4:에스프레소) '))
coffee_machine(coffee)
print('길동손님~ 커피 여기 있습니다.')

coffee = int(input('민수손님, 어떤 커피 드릴까요 ? (1:아메리카노, 2:카페라떼, 3:카푸치노, 4:에스프레소) '))
coffee_machine(coffee)
print('민수손님~ 커피 여기 있습니다.')
