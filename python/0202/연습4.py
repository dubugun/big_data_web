a = [(1,3),(3,5),(7,9),(13,15)]

for i in range(len(a)):
    S = 0
    for j in range(len(a[i])):
        S += a[i][j]
    print(S)
