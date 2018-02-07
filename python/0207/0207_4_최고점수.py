def maxnum(list1) :
    result = 0
    for i in range(0,len(list1)-1) :
        if list1[i] >= list1[i+1] :
            result = list1[i]
        else :
            result = list1[i+1]
    print('최고 점수는 ', result, '점 입니다.')
