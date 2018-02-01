pencil = 1000; pen = 2000

num_pencil = int(input("구매할 연필의 개수를 입력해주세요"))
num_pen = int(input("구매할 팬의 개수를 입력해주세요"))

total_price = pencil * num_pencil + pen * num_pen
sale_price = total_price * 0.7
print("총 가격은",sale_price,"원 입니다.")
