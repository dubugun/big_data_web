fruit = ['strawberry', 'apple', 'banana', 'watermelon', 'grape']

result = []
for i in range(len(fruit)-1, -1, -1):
    j = fruit[i]
    result.append(j)

print(result)
