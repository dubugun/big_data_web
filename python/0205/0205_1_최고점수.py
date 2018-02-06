def highscore(list1) :
    for i in range(len(list1) - 1) :
        if list1[i] >= list1[i+1] :
            k = list1[i]
        else :
            k = list1[i+1]

    print('최고 점수는 %d 점 입니다.' % k)
