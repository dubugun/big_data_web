def LM(a,b,c) :
    if a>= b and a>= c :
        return a
    elif b>= a and b>= c :
        return b
    else :
        return c

def TR(d,e,f) :
    g = LM(d,e,f)
    if (g >= d+e) or (g>= d+f) or (g>= e+f) :
        print('삼각형이 아니다')
    elif d == e and e == f :
        print('정삼각형')
    elif (d == e) or (e == f) or (d == f) :
        print('이등변삼각형')
    elif ((d ** 2) + (e ** 2 ) == g ** 2 ) or ((d ** 2) + (f ** 2 ) == g ** 2 ) or ((e ** 2) + (f ** 2 ) == g ** 2 ):
        print('직각삼각형')
    else :
        print('삼각형')
