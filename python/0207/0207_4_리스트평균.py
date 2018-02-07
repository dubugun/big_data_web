def list_avg(numlist) :
    sum1 = 0
    for number in numlist :
        sum1 = sum1 + number
    avg = sum1 / len(numlist)
    return avg
