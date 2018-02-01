import random

time = random.randint(1,24)
weather1 = [True, False]
weather2 = random.randint(0,1)

if weather2 == 0 :
    if time >= 6 and time <= 9:
        print('화창하고, 지금 시간은 %d시로 종달새가 노래를 합니다' % time)
    else :
        print("화창하지만 지금은 %d시로  종달새가 노래를 하지 않습니다." % time)

else :
    print(" 날씨가 화창하지 않아 종달새가 노래를 하지 않습니다.")
