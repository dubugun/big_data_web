sec = 0
def time() :
    while True:        
        sec = int(input('초 입력: '))
        if sec > 3600 * 24 :
            continue
        else :
            hour = sec//3600
            sec -= hour * 3600
            minu = sec // 60
            sec -= minu * 60
            break
    print('%d 시 %d 분 %d 초 입니다' % (hour, minu, sec))
