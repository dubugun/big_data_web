str1 = input('과일이름들을 입력해주세요')


fruit = str1.split(',')


result = []
for i in range(len(fruit)-1, -1, -1):
    j = fruit[i]
    result.append(j)

print(result)


